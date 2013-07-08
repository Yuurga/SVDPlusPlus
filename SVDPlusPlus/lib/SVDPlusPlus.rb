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
	end
	
  end
end
