# frozen_string_literal: true

require "spec_helper"
require "date"
require_relative "../../app/models/period"

RSpec.describe Period do
  subject(:period) { described_class.new(Date.new(2026, 3, 1), Date.new(2026, 3, 10)) }

  describe "#covers?" do
    it "covers a date inside the range" do
      expect(period.covers?(Date.new(2026, 3, 5))).to be(true)
    end

    it "covers the first day" do
      expect(period.covers?(Date.new(2026, 3, 1))).to be(true)
    end

    it "covers the last day" do
      expect(period.covers?(Date.new(2026, 3, 10))).to be(true)
    end

    it "does not cover the day before it starts" do
      expect(period.covers?(Date.new(2026, 2, 28))).to be(false)
    end

    it "does not cover the day after it ends" do
      expect(period.covers?(Date.new(2026, 3, 11))).to be(false)
    end

    context "when the period has no end" do
      subject(:period) { described_class.new(Date.new(2026, 3, 1), nil) }

      it "covers a date far in the future" do
        expect(period.covers?(Date.new(2030, 1, 1))).to be(true)
      end

      it "does not cover the day before it starts" do
        expect(period.covers?(Date.new(2026, 2, 28))).to be(false)
      end
    end
  end

  describe "#overlaps?" do
    it "overlaps a period that shares a single day" do
      other = described_class.new(Date.new(2026, 3, 10), Date.new(2026, 3, 20))

      expect(period.overlaps?(other)).to be(true)
    end

    it "does not overlap a period that starts the day after it ends" do
      other = described_class.new(Date.new(2026, 3, 11), Date.new(2026, 3, 20))

      expect(period.overlaps?(other)).to be(false)
    end

    it "overlaps a period contained inside it" do
      other = described_class.new(Date.new(2026, 3, 3), Date.new(2026, 3, 5))

      expect(period.overlaps?(other)).to be(true)
    end

    it "gives the same answer no matter which side asks" do
      other = described_class.new(Date.new(2026, 3, 5), Date.new(2026, 3, 20))

      expect(period.overlaps?(other)).to be(true)
      expect(other.overlaps?(period)).to be(true)
    end

    context "when one of them has no end" do
      it "overlaps a period that starts much later" do
        open_period = described_class.new(Date.new(2026, 3, 1), nil)
        other = described_class.new(Date.new(2030, 1, 1), Date.new(2030, 2, 1))

        expect(open_period.overlaps?(other)).to be(true)
      end
    end

    context "when others has no end" do
      it "it returns nil when other" do
        other = described_class.new(Date.new(2030, 1, 1), nil)

        expect(period.overlaps?(other)).to be(false)
      end
    end
  end

  describe "#days" do
    it "counts both ends" do
      expect(period.days).to eq(10)
    end

    it "counts a period of a single day as one day" do
      expect(described_class.new(Date.new(2026, 3, 1), Date.new(2026, 3, 1)).days).to eq(1)
    end
    context "when period has no end" do
        open_period = described_class.new(Date.new(2026, 3, 1), nil)
      it "returns nil if end date is nil" do
        expect(open_period.days).to eq(nil)
      end
    end
  end
end
