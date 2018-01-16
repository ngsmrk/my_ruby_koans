module Mod
	class Class
	end
end

class NestedClassInstantiation < Test::Unit::TestCase
	def test_with_loop

		value = "Mod::Class"
		values = value.split "::"

		obj = Object.class
		new_value = nil
		until values.empty?
			new_value = values.shift
			obj = obj.const_get(new_value)
		end

		assert_equal obj.new.class, Mod::Class
	end

	def test_recursive

		value = "Mod::Class"
		values = value.split "::"

		obj = get_class Object.class, values
		assert_equal obj.new.class, Mod::Class
	end

	def get_class(parent, list)
		return parent if list.empty?
		next_value = list.shift
		obj = parent.const_get next_value
		return get_class(obj, list)
	end
end