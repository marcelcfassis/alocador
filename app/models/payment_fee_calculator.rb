class PixFeeCalculator
  def calculate(amount)
    0
  end
end

class BoletoFeeCalculator
  def calculate(amount)
    amount * 0.02
  end
end

class CardFeeCalculator
  def calculate(amount)
    amount * 0.04 + 0.5
  end
end

class PaymentFeeCalculator
  attr_reader :amount, :payment_method

  def initialize(payment_method:, amount:)
    @payment_method = payment_method
    @amount = amount
  end

  PAYMENT_METHODS = {
    "pix" => PixFeeCalculator,
    "boleto" => BoletoFeeCalculator,
    "card" => CardFeeCalculator
  }.freeze

  def fee
    strategy_class = PAYMENT_METHODS.fetch(payment_method)
    strategy_class.new.calculate(amount)
  end
end
