class Dessert
    def initialize(name, calories)
        @name = name
        @calories = calories
    end

    def name=(name)
    	@name = name
    end

  	def calories=(calories)
  		@calories = calories
  	end

    def name
    	@name
    end

    def calories
    	@calories
    end

    def healthy?
        if @calories < 200; true
        else
        	false
        end
    end

    def delicious?
        true
    end
end

# Cake = Dessert.new("cake", 200)

# puts Cake.name
# Cake.name=("pie")
# puts Cake.name
# puts Cake.calories
# puts Cake.healthy?
# puts Cake.delicious?
# Cake.calories=(100)
# puts Cake.healthy?

class JellyBean < Dessert
    def initialize(name, calories, flavor)
        @flavor = flavor
    end

    def flavor=(flavor)
    	@flavor = flavor
    end

    def flavor
    	@flavor
    end

    def delicious?
        # Your code here
    end
end