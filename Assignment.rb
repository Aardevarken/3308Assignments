#Part 1
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