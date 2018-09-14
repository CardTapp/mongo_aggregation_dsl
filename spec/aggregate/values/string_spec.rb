# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Values::String do
  describe "#to_s" do
    it "properly formats string when is_key = true" do
      expect(Aggregate::Values::String.new("test", true).to_s).to eq "test"
    end

    it "properly formats string when is_key = false" do
      expect(Aggregate::Values::String.new("test", false).to_s).to eq "'test'"
    end
  end

  describe "#handles" do
    it "returns true for strings" do
      expect(Aggregate::Values::String.handles?("")).to eq true
    end

    it "returns false for non strings" do
      expect(Aggregate::Values::String.handles?(1)).to eq false
    end
  end
end
