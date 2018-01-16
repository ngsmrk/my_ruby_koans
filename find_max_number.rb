class FindMaxNumber < Test::Unit::TestCase
  def test_with_loop
    x = [3,56,89,1,34,7]
    max = 0
    
    x.each do | number |
      max = number if number > max
    end
    
    assert_equal 89, max
  end
  
  def test_recursive
    x = [3,56,89,1,34,7]
    max = max_number x
    assert_equal 89, max
  end

  def max_number(value = 0, array)
    return value if array.empty?
    next_value = array.shift
    value = next_value if next_value > value
    return max_number value, array
  end
end