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
	
  end
end
