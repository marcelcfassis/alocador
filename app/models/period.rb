class Period
  attr_reader :start_at, :end_at

  def initialize(start_at, end_at)
    @start_at = start_at
    @end_at = end_at
  end

  def covers?(date)
    return date >= @start_at if @end_at.nil?
    date >= @start_at && date <= @end_at
  end

  def days
    return nil if @end_at.nil?
    (@end_at - @start_at) + 1
  end

  def overlaps?(other)
    return true if end_at.nil?
    return end_at >= other.start_at if other.end_at.nil?
    end_at >= other.start_at && start_at <= other.end_at
  end
end
