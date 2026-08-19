require_relative "../../app/models/allocation_calculator"
require_relative "../../app/models/allocation_invoice"

RSpec.describe AllocationInvoice do
  describe "#to_email_text" do
    it "monta o texto da fatura com nome, valor total e detalhes" do
      calculator = AllocationCalculator.new(hours: 10, hourly_rate: 50)
      invoice = AllocationInvoice.new(person_name: "Marcel", calculator: calculator)

      expect(invoice.to_email_text).to eq("Fatura de Marcel: R$ 500.00 (10h a R$ 50/h)")
    end

    it "usa o total de QUALQUER objeto que responda a hours, hourly_rate e total — sem precisar de um AllocationCalculator real" do
      fake_calculator = Struct.new(:hours, :hourly_rate, :total).new(3, 100, 999.99)
      invoice = AllocationInvoice.new(person_name: "Cliente Fake", calculator: fake_calculator)

      expect(invoice.to_email_text).to eq("Fatura de Cliente Fake: R$ 999.99 (3h a R$ 100/h)")
    end
  end
end
