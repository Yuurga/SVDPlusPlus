require "SVDPlusPlus/version"
require 'ruby-svd'
require 'mathn'

module SVDPlusPlus
  # Your code goes here...
  class SvdPlusPlus 
  
	# Create a new SVD Matrix with m(Users) rows, n(goods,topics etc) columns, 
	def initialize(m,n)
		@m=m
		@n=n
		@tdm=SVDMatrix.new(m,n) 
		
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
	
  end
end
