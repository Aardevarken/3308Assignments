class Dessert
    def initialize(name, calories)
        @name = name
        @calories = calories
    end

    def name
    	return @name
    end

    def calories
    	return @calories
    end

    def healthy?
        # Your code here
    end

    def delicious?
        return true
    end
end

Cake = Dessert.initialize("Cake", 200)

puts Cake.name
puts Cake.calories

class JellyBean < Dessert
    def initialize(name, calories, flavor)
        # Your code here
    end

    def delicious?
        # Your code here
    end
end