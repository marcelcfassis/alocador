class AllocationInvoice
  attr_reader :calculator

  def initialize(person_name:, calculator:)
    @person_name = person_name
    @calculator = calculator
  end

  def to_email_text
    # Fatura de Marcel: R$ 500.00 (10h a R$ 50/h)
    "Fatura de #{@person_name}: R$ #{format('%.2f', @calculator.total)} (#{calculator.hours}h a R$ #{calculator.hourly_rate}/h)"
  end
end
