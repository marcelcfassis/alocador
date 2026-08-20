require_relative "../../app/models/payment_fee_calculator"

RSpec.describe PaymentFeeCalculator do
  describe "#fee" do
    it "pix não tem taxa" do
      calculator = PaymentFeeCalculator.new(payment_method: "pix", amount: 100)

      expect(calculator.fee).to eq(0)
    end

    it "boleto cobra 2% do valor" do
      calculator = PaymentFeeCalculator.new(payment_method: "boleto", amount: 100)

      expect(calculator.fee).to eq(2.0)
    end

    it "cartão cobra 4% + R$0,50 fixo" do
      calculator = PaymentFeeCalculator.new(payment_method: "card", amount: 100)

      expect(calculator.fee).to eq(4.5)
    end

    it "pagamento nao existe" do
      calculator = PaymentFeeCalculator.new(payment_method: "pix-card", amount: 100)

      expect { calculator.fee }.to raise_error(KeyError)
    end
  end
end
