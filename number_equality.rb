class NumberEqualityTest < Test::Unit::TestCase
	def test_integer_equal
		assert_equal true,  1 ==   1, "Integer should match using =="
		assert_equal true,  1 ===  1, "Integer should match using ==="
		assert_equal true,  1.eql?(1), "Integer should match using eql?"
		assert_equal true,  1.equal?(1), "Integer should match using equal?"						
	end
	def test_float_equal
		assert_equal true,  1.0 ==   1.0, "Float should match using =="
		assert_equal true,  1.0 ===  1.0, "Float should match using ==="
		assert_equal true,  1.0.eql?(1.0), "Float should match using eql?"
		assert_equal true, 1.0.equal?(1.0), "Float should match using equal?"
	end
	def test_mixed_equal
		assert_equal true,  1 ==   1.0, "Integer and Float should match using =="
		assert_equal true,  1 ===  1.0, "Integer and Float should match using === because of type conversion"
		assert_equal false, 1 ===  1.5, "Integer and Float should not match using === despite type conversion"		
		assert_equal false, 1.eql?(1.0), "Integer and Float should not match using eql?"
		assert_equal false, 1.equal?(1.0), "Integer and Float should not match using equal?"						
	end	
end