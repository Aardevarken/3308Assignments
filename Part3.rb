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
