class TestClass
end

class ObjectEqualityTest < Test::Unit::TestCase
	def test_equal
		assert_equal false, Object.new ==   Object.new, "Object should not match using =="
		assert_equal false, Object.new ===  Object.new, "Object should not match using ==="
		assert_equal false, Object.new.eql?(Object.new), "Object should not match using eql?"
		assert_equal false, Object.new.equal?(Object.new), "Object should not match using equal?"						
	end

	def test_equal_using_variables
		x = Object.new
		assert_equal true, x ==   x,   "Object variable should match using =="
		assert_equal true, x ===  x,   "Object variable should match using ==="
		assert_equal true, x.eql?(x),  "Object variable should match using eql?"
		assert_equal true, x.equal?(x),"Object variable should match using equal?"						
	end

	def test_equal_using_classes
		x = TestClass.new
		assert_equal true, x ==   x,   "Object variable should match using =="
		assert_equal true, x ===  x,   "Object variable should match using ==="
		assert_equal true, x.eql?(x),  "Object variable should match using eql?"
		assert_equal true, x.equal?(x),"Object variable should match using equal?"						
	end		
end