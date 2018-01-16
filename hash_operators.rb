class HashOperators < Test::Unit::TestCase
  @@the_hash = { :a => 1, :b => 2, :c => 3, :d => 4 }

	def test_collect
    assert_equal [false,true,false,true], @@the_hash.collect { | key_value_array | key_value_array[1] % 2 == 0 }	  
    assert_equal [false,true,false,true], @@the_hash.collect { | key, value | value % 2 == 0 }
  end

	def test_detect
    assert_equal [:b, 2], @@the_hash.detect { | key_value_array | key_value_array[1] % 2 == 0 }   	  
    assert_equal [:b, 2], @@the_hash.detect { | key, value | value % 2 == 0 }   
  end

  def test_fetch
    assert_equal 1, @@the_hash.fetch(:a)
    assert_equal 99, @@the_hash.fetch(:z, 99)
    assert_equal :z, @@the_hash.fetch(:z) {  | key | key }     
  end

	def test_inject
    assert_equal [:a, 1, [:b, 2], [:c, 3], [:d, 4]], @@the_hash.inject { | cumulative_value, key_value_array | cumulative_value << key_value_array; cumulative_value }
    assert_equal [:a, 1, :b, 2, :c, 3, :d, 4], @@the_hash.inject(:+)
    new_hash = @@the_hash.inject({}) { |h, (k, v)| h[k.upcase] = v; h }
    assert_equal new_hash, {:A=>1, :B=>2, :C=>3, :D=>4}
  end

  def test_reject
    x = {:a => 1, :c => 3}
    assert_equal x, @@the_hash.reject { | key, value | value % 2 == 0 }
  end

  def test_select
    x = {:b => 2, :d => 4}    
    assert_equal x, @@the_hash.select { | key, value | value % 2 == 0 }
  end
end