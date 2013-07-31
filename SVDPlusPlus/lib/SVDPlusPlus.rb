require "SVDPlusPlus/version"
require 'ruby-svd'
require 'mathn'

module SVDPlusPlus
  # Your code goes here...
  class SvdPlusPlus 
  
	# Create a new SVD Matrix with m(Users) rows, n(goods,topics etc) columns, 
	def initialize(m,n, tdm=nil)
		@m=m
		@n=n
		@tdm=SVDMatrix.new(m,n) if tdm==nil
		
		#Results of singular value decomposition of matrix tdm
		@u=nil
		@w=nil
		@v=nil
		
		#middle rating for all users\goods
		@mu_=0
		
		# vector b_u
		@b_u_=nil
		
		# vector b_v
		@b_v_=nil
		
		#matrix q
		@q_=nil
		
		#matrix p
		@p_=nil
    
	end
	
	#Multiplication of vectors v[a] *u[i]
	def dot(v,u,a,i)
		res = 0
		for j in 0..1
			res+=v[a,j]*u[i,j]
		end
		return res
	end
	
	#return eps between two vectors
	def get_eps(new_v,old_v)
		len=new_v.length
		sum=0.0
		mod_vector=0
		for i in 0..len-1
		  sum+= (new_v[i]-old_v[i]).abs
		  mod_vector+= old_v[i]**2
		end
		mod_vector=Math.sqrt(mod_vector)
		res = sum.to_d / mod_vector.to_d
		return res
	end
	
	
	def learn()
		res=tdm.decompose(2)
		
		@u=res[0]
		@w=res[1]
		@v=res[2]
    
		max_v=@n
		max_u=@m
		total = max_u*max_v
	
    
		b_u = Array.new(max_u) {0}
		b_v = Array.new(max_v) {0}

		q = SVDMatrix.new(@n, 2)
		p = SVDMatrix.new(@m, 2)
    
		# q nx2
		for i in 0..@n-1 do
		  for j in 0..1 do
			q[i,j]=0.000001
		  end
		end
		
		# p mx2
		for i in 0..@m-1 do
		  for j in 0..1 do
			p[i,j]=0.000001*j
		  end
		end
		
		#prepared continue
		eps_u=1
		eps_v=1
		iter=0
		eta=0.05
		mu=0.0
		lambda=0.1
		lambda2=0.1
		
		err = 0.0;
		rmse = 1;
		old_rmse = 0;
		
		threshold = 0.01;
		
		#learning cycle
		while ([eps_u,eps_v].max > 0.000001 ) do

			b_u_old=Array.new(b_u.length) {|id| b_u[id]}
			b_v_old=Array.new(b_v.length) {|id| b_v[id]}
			
			for i in 0..@m-1 do
			  for a in 0..@n-1 do
				err=tdm[i,j]-mu-b_u[i]-b_v[a]-dot(@v,@u,a,i)
				
				mu = err * eta
				b_u[i]=b_u[i]+eta * (err - lambda * b_u[i])
				b_v[a]=b_u[a]+eta * (err - lambda * b_u[a])
				
				for j in 0..1 do
				  q[a,j]=q[a,j]+eta*(err*p[i,j]-lambda2*q[a,j])
				  p[i,j]=p[i,j]+eta*(err*q[a,j]-lambda2*p[i,j])
				end
				
			  end 
			end
			eps_u=get_eps(b_u,b_u_old)
			eps_v=get_eps(b_v,b_v_old)
			iter+=1
		end
		  
		puts iter
		@mu_=mu
		@b_u_=b_u
		@b_v_=b_v
		@q_=q
		@p_=p
	
	end
	
	#return prediction for user i for all items
	def get_prediction(i)
		res=[]
		for j in 0..@n-1
			bu=@b_u_[i]
			
			bv=@b_v_[j]
			
			mult=dot(@p_,@q_,i,j)
			#mult=0 if mult < 0
			ver=@mu+bu+bv+mult
			ver=2 if ver > 2
			  res << ver
		end
		return res
  end
	
  end
end
