class Period

  def initialize(start_at, end_at)
    @start_at = start_at
    @end_at = end_at
  end

  def covers?(date)
    return date >= @start_at if @end_at.nil?
    date >= @start_at && date <= @end_at

  end


end
