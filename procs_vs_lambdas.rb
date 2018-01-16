class ProcsVsLambdas < Test::Unit::TestCase
	def test_definition
		my_proc = Proc.new {|n| n*factor }
		assert_equal Proc, my_proc.class
		assert_equal false, my_proc.lambda?

		my_lambda = lambda {|x, y| puts x + y}
		assert_equal Proc, my_lambda.class
		assert_equal true, my_lambda.lambda?

		my_stabby_lambda = ->(x, y) {puts x + y}
		assert_equal Proc, my_stabby_lambda.class
		assert_equal true, my_stabby_lambda.lambda?
	end

	def test_parameter_validation
		pnew = Proc.new {|x, y| x + y}
		lamb = lambda   {|x, y| x + y}
		 
		assert_nothing_raised do
			pnew.call(2, 4, 11)
		end
		 
		assert_raise ArgumentError do
			lamb.call(2, 4, 11)
		end
	end

	def test_return_method_for_lambda
		assert_equal 1, lambda_return
	end

	def test_return_method_for_proc
		assert_equal -2, proc_return	
	end

	def proc_return
	  Proc.new { return -2}.call
	  return -1
	end

	def lambda_return
	  lambda { return 2}.call
	  return 1
	end
end