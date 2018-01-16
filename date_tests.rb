require 'active_support/all'

Time.zone = "Hawaii"

class DateTest < Test::Unit::TestCase
	def test_date_is_correct
		# never use Date.today always use Date.current
		correct_date = Date.current
		assert_equal correct_date.day, Time.zone.now.day
		assert_equal correct_date.month, Time.zone.now.month
		assert_equal correct_date.year, Time.zone.now.year
	end
	def test_datetime_is_correct
		# never use Date.current.to_time always use Date.current.to_time_in_current_zone - otherwise you lose the offset
		correct_date_time = Date.current.to_time_in_current_zone
		assert_equal "Hawaii", correct_date_time.time_zone.name
		assert_equal "HST", correct_date_time.zone

		incorrect_date_time = Date.current.to_time
		assert_raise NoMethodError do
		  incorrect_date_time.time_zone  #Raises NoMethodError because this date has no timezone
		end

		assert_equal "GMT", Date.today.to_time.zone

	end
end

class TimeTest < Test::Unit::TestCase
	def test_time
		correct_time = Time.current
		assert_equal "HST", correct_time.zone

		incorrect_time = Time.now
		assert_equal "GMT", incorrect_time.zone
	end

	def test_parse
		correct_time = Time.zone.parse("2012-03-02 16:05:37")
		assert_equal "HST", correct_time.zone

		incorrect_time = Time.parse("2012-03-02 16:05:37")
		assert_equal "GMT", incorrect_time.zone
	end

	def test_strptime
		time_string = "2012-03-02 16:05:37"
		correct_time = Time.strptime(time_string, '%Y-%m-%d %H:%M:%S').in_time_zone(Time.zone)
		assert_equal "HST", correct_time.zone

		incorrect_time = Time.strptime(time_string, '%Y-%m-%d %H:%M:%S')
		assert_equal "GMT", incorrect_time.zone
	end
end