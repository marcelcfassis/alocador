require_relative "../../app/models/money"
require "bigdecimal"

RSpec.describe Money do
let(:money) { described_class.new(14.5) }

let(:other_money) { described_class.new(16.5) }
  describe "money" do
    it "soma 2 money" do
      expect(money.soma(other_money).money).to eq(BigDecimal(31.0, 2))
    end

    it "Money maior que other_money" do
      expect(money.greater_than?(other_money)).to be(false)
    end
  end
end
