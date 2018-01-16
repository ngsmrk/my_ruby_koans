class StringEqualityTest < Test::Unit::TestCase
	def test_equal
		assert_equal true, "x" ==   "x", "String should match using =="
		assert_equal true, "x" ===  "x", "String should match using ==="
		assert_equal true, "x".eql?("x"), "String should match using eql?"
		assert_equal false, "x".equal?("x"), "String should not match using equal?"						
	end
end