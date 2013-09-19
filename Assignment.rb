#Assignment 2: Programming in Ruby
#CSCI3308-F13
#Morgan Garske
#Last updated: 9/18/13

#Part 1 - Classes
#a)
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

#b)
class JellyBean < Dessert
    def initialize(name, calories, flavor)
    	super(name,calories)
        @flavor = flavor
    end

    def flavor=(flavor)
    	@flavor = flavor
    end

    def flavor
    	@flavor
    end

    def delicious?
        if flavor == "black licorice"; return false; end
        super
    end
end

#Part 2 - Object Oriented Programming
class Class
    def attr_accessor_with_history(attr_name)
        attr_name = attr_name.to_s       # make sure it's a string
        attr_reader attr_name            # create the attribute's getter
        attr_reader attr_name+"_history" # create bar_history getter |
        class_eval %Q"
        	def #{attr_name}= (attr)
        		if @#{attr_name}_history.nil?
        			@#{attr_name}_history = [@#{attr_name}]
        		end
        		@#{attr_name} = attr
        		@#{attr_name}_history.push(attr)
        	end
        "
    end
end

class Foo
    attr_accessor_with_history :bar
end

#Part 3 - More OOP
#a) — Currency conversion
class CurrencyNotSupportedError < StandardError; end

class Numeric
 @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
 def method_missing(method_id)
   singular_currency = method_id.to_s.gsub( /s$/, '')
   if @@currencies.has_key?(singular_currency)
     self * @@currencies[singular_currency]
   else
     super
   end
 end
 def in(currency)
 	current_currency = currency.id2name.gsub( /s$/, '')
 	if @@currencies.has_key?(current_currency)
 		self / @@currencies[current_currency]
 	else raise CurrencyNotSupportedError
 	end
 end
end

#b) — Palindromes
def palindrome?(string)
	str = string.downcase
	str = string.gsub(/[\W]/, "")
	if str == str.reverse
		return true
	end
	return false
end

class String
	def method_missing(method_id)
		if method_id.to_s == "palindrome?"
			return palindrome?(self)
		else
			super
		end
	end
end

#c) — Palindromes again
module Enumerable
	def method_missing(method_id)
		if method_id.to_s == "palindrome?"
			return palindrome?(self.to_a.to_s)
		else
			super
		end
	end
end

#Part 4 - Blocks
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