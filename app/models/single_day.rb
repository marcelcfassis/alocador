class SingleDay
  attr_reader :date

  def initialize(date)
    @date = date
  end


  def covers?(other_date)
    date == other_date
  end
end
