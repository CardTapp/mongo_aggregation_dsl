# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Values::Symbol do
  describe "#to_s" do
    it "properly formats string when is_key = true" do
      expect(Aggregate::Values::Symbol.new(:test, true).to_s).to eq "'test'"
    end

    it "properly formats string when is_key = false" do
      expect(Aggregate::Values::Symbol.new(:test, false).to_s).to eq "'test'"
    end
  end

  describe "#handles" do
    it "returns true for symbols" do
      expect(Aggregate::Values::Symbol.handles?(:test)).to eq true
    end

    it "returns false for non symbols" do
      expect(Aggregate::Values::Symbol.handles?(1)).to eq false
    end
  end
end
