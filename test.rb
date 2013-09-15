class Class
    def attr_accessor_with_history(attr_name)
        attr_name = attr_name.to_s # make sure it's a string
        attr_reader attr_name
        attr_reader attr_name+"_history"
        class_eval %Q"
            def #{attr_name}=(value)
                if !defined? @#{attr_name}_history
                    @#{attr_name}_history = [@#{attr_name}]
                end
                @#{attr_name} = value
                @#{attr_name}_history << value
            end
        "
    end
end

class Foo
    attr_accessor_with_history :bar
end

f = Foo.new
f.bar = 1
puts f.bar
f.bar = 2
puts f.bar
print f.bar_history # => if your code works, should be [nil, 1, 2]
puts