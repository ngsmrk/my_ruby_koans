class AndOperatorTest < Test::Unit::TestCase
	def test_boolean_and
		assert_equal true,  true && true
		assert_equal false, true && false
		assert_equal false, false && true
		assert_equal false, false && false		
	end

	def test_and
		assert_equal true,  true and true
		assert_equal true,  true and false
		assert_equal false, false and true
		assert_equal false, false and false		
	end
end

class OrOperatorTest < Test::Unit::TestCase
	def test_boolean_and
		assert_equal true,  true || true
		assert_equal true,  true || false
		assert_equal true,  false || true
		assert_equal false, false || false		
	end

	def test_and
		assert_equal true,  true or true
		assert_equal true,  true or false
		assert_equal false, false or true
		assert_equal false, false or false		
	end
end