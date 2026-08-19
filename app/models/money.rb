require "bigdecimal/util"
require "bigdecimal"

class Money
  attr_reader :money

  def initialize(money)
    @money = money.to_d
  end

  def soma(other_money)
    Money.new(@money + other_money.money)
  end

  def greater_than?(other_money)
    @money > other_money.money
  end
end
