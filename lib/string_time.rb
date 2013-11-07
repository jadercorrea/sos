class StringTime
  def initialize(times)
    @times = times
  end

  def total_time
    # 1:20
    # 2:50
    # 3:40
    #
    # hours = 1 + 2 + 3
    # minutes = 20 + 50 + 40
    # 6:110

    decimal_minutes = (minutes.to_f / 60)
    total_hours = hours + decimal_minutes.floor
    total_minutes = minutes
    if total_minutes > 59
      subminute = decimal_minutes - decimal_minutes.floor
      total_minutes = (subminute * 60).round
    end

    total_minutes = "0#{total_minutes}" unless total_minutes.to_s.size > 1

    "#{total_hours}:#{total_minutes}"
  end

  private

  attr_reader :times

  def hours
    times.inject(0) do |memo, time|
      # 1:20
      memo += time.scan(/([0-9]{1,2}):/).flatten[0].to_i
    end
  end

  def minutes
    times.inject(0) do |memo, time|
      # 1:20
      memo += time.scan(/:([0-9]{1,2})/).flatten[0].to_i
    end
  end
end
