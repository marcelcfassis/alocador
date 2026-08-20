class PaymentFeeCalculator
  attr_reader :amount
  def initialize(payment_method:, amount:)
    @payment_method = payment_method
    @amount = amount
  end

  def fee
    if @payment_method == "pix"
      PixFeeCalculator.new().calculate
    elsif @payment_method == "boleto"
      BoletoFeeCalculator.new.calculate(amount)
    elsif @payment_method == "card"
      CardFeeCalculator.new.calculate(amount)
    end
  end
end

class PixFeeCalculator
  def calculate
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
