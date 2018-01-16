class ArrayEqualityTest < Test::Unit::TestCase
	def test_equal
		assert_equal true, [1,2] ==  [1,2], "Array should match using =="
		assert_equal true, [1,2] ===  [1,2], "Array should match using ==="
		assert_equal true, [1,2].eql?([1,2]), "Array should match using eql?"
		assert_equal false,[1,2].equal?([1,2]), "Array should not match using equal?"
	end
end

class HashEqualityTest < Test::Unit::TestCase
	def test_equal
		assert_equal true,  {:a => 1}  ==  {:a => 1},  "Hash should match using == and with symbol keys"
		assert_equal true,  {'a' => 1} ==  {'a' => 1}, "Hash should match using == and with string keys"
		assert_equal false, {:a => 1}  ==  {'a' => 1}, "Hash should not match using == and with mixed symbol and string keys"

		assert_equal true,  {:a => 1}  ===  {:a => 1},  "Hash should match using === and with symbol keys"
		assert_equal true,  {'a' => 1} ===  {'a' => 1}, "Hash should match using === and with string keys"
		assert_equal false, {:a => 1}  ===  {'a' => 1}, "Hash should not match using === and with mixed symbol and string keys"

		assert_equal true,  {:a => 1}.eql?({:a => 1}),  "Hash should match using eql? and with symbol keys"
		assert_equal true,  {'a' => 1}.eql?({'a' => 1}), "Hash should match using eql? and with string keys"
		assert_equal false, {:a => 1}.eql?({'a' => 1}), "Hash should not match using eql? and with mixed symbol and string keys"

		assert_equal false,  {:a => 1}.equal?({:a => 1}),  "Hash should not match using equal? and with symbol keys"
		assert_equal false,  {'a' => 1}.equal?({'a' => 1}), "Hash should not match using equal? and with string keys"
		assert_equal false, {:a => 1}.equal?({'a' => 1}), "Hash should not match using equal? and with mixed symbol and string keys"						
	end
end