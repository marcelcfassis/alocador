require_relative "../../app/models/allocation_calculator"

RSpec.describe AllocationCalculator do
  describe "#total" do
    it "multiplica horas pelo valor da hora" do
      calculator = AllocationCalculator.new(hours: 10, hourly_rate: 50)

      expect(calculator.total).to eq(500)
    end
  end
end
