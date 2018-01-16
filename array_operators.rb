class ArrayOperators < Test::Unit::TestCase
  @@the_array = [1, 2, 3, 4]

	def test_collect
    assert_equal [false,true,false,true], @@the_array.collect { | i | i % 2 == 0 }
  end

	def test_detect
    assert_equal 2, @@the_array.detect { | i | i % 2 == 0 }
  end

	def test_fetch
    assert_equal 1, @@the_array.fetch(0)
    assert_equal 4, @@the_array.fetch(-1)
    assert_equal 99, @@the_array.fetch(10, 99)
    assert_equal 100, @@the_array.fetch(10) {  | pos | pos * pos }     
  end

	def test_inject
    assert_equal 10, @@the_array.inject { | cumulative_value, array_value | cumulative_value + array_value }
    assert_equal 10, @@the_array.inject(:+)
  end  

	def test_map
    assert_equal [false,true,false,true], @@the_array.map { | i | i % 2 == 0 }
  end

	def test_reject
    assert_equal [1,3], @@the_array.reject { | i | i % 2 == 0 }
  end

	def test_select
    assert_equal [2,4], @@the_array.select { | i | i % 2 == 0 }
  end
end