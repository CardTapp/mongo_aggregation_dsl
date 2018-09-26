# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Values::Boolean do
  describe "#to_s" do
    it "properly formats string when is_key = true" do
      expect(Aggregate::Values::Boolean.new(true, true).to_s).to eq "true"
    end

    it "properly formats string when is_key = false" do
      expect(Aggregate::Values::Boolean.new(false, false).to_s).to eq "false"
    end
  end

  describe "#handles" do
    it "returns true for true" do
      expect(Aggregate::Values::Boolean.handles?(true)).to eq true
    end

    it "returns true for false" do
      expect(Aggregate::Values::Boolean.handles?(false)).to eq true
    end

    it "returns false for strings" do
      expect(Aggregate::Values::Boolean.handles?("")).to eq false
    end
  end
end
