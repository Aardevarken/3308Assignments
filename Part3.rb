class Numeric
 @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
 def method_missing(method_id)
   singular_currency = method_id.to_s.gsub( /s$/, '')
   if @@currencies.has_key?(singular_currency)
     self * @@currencies[singular_currency]
     @currency = singular_currency
   else
     super
   end
 end
 def in(currency)
 	case currency
 	when :euro or :euros
 	end
 	when :yen
 	end
 	when :rupee or :rupees
 	end
 	when :dollar or :dollars
 	end
end


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

module Enumerable
	def method_missing(method_id)
		if method_id.to_s == "palindrome?"
			return palindrome?(self.to_a.to_s)
		else
			super
		end
	end
end
