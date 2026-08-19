class AllocationCalculator
  attr_reader :hours, :hourly_rate
  def initialize(hours:, hourly_rate:)
    @hours = hours
    @hourly_rate = hourly_rate
  end

  def total
    @hours * @hourly_rate
  end
end
