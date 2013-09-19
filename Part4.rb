class CartesianProduct
    include Enumerable
    def initialize(a, b)
    	@a = a
    	@b = b
    end
    def each
    	@a.each {|x| 
    		@b.each{|y|
    			yield [x,y]
    		}
    	}
    end
end

c = CartesianProduct.new([:a,:b,:c], [4,5,6])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }