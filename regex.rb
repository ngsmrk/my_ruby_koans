class Regex < Test::Unit::TestCase

  def domain_name(url)
    match = url.match(/(\Ahttp[s]?:\/\/[www]*[.]*)(.*)(\..*)/)
    domain = match.captures[1] unless match.nil?

    domain
  end

  def test_match
    assert_equal domain_name('https://www.github.com/carbonfive/raygun'), 'github'
  end

  def test_match_returns_nil
    assert_equal nil, 'https://github.com/carbonfive/raygun'.match(/www/)
  end

end