require "rails_helper"
require_relative "../../app/models/single_day"

RSpec.describe SingleDay do
  describe "#covers?" do
    it "é true quando a data é o mesmo dia" do
      single_day = SingleDay.new(Date.new(2026, 8, 18))

      expect(single_day.covers?(Date.new(2026, 8, 18))).to be(true)
    end

    it "é false quando a data é outro dia" do
      single_day = SingleDay.new(Date.new(2026, 8, 18))

      expect(single_day.covers?(Date.new(2026, 8, 19))).to be(false)
    end
  end

  describe "duck typing" do
    it "Period e SingleDay, sem parentesco nenhum, respondem a covers? do mesmo jeito" do
      period = Period.new(Date.new(2026, 8, 1), Date.new(2026, 8, 31))
      single_day = SingleDay.new(Date.new(2026, 9, 15))
      hoje = Date.new(2026, 8, 18)

      cobrem_hoje = [ period, single_day ].select { |p| p.covers?(hoje) }

      expect(cobrem_hoje).to eq([ period ])
    end
  end
end
