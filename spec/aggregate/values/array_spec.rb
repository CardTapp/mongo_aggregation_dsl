# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Values::Array do
  describe "#transpose" do
    it "raises if is_key is true" do
      expect { Aggregate::Values::Array.new([], true).transpose }.to raise_error(ArgumentError)
    end

    it "properly formats an array" do
      expect(Aggregate::Values::Array.new([1, 2], false).transpose).to eq [1, 2]
    end
  end

  describe "#handles" do
    it "returns true for arrays" do
      expect(Aggregate::Values::Array.handles?([])).to eq true
    end

    it "returns false for non arrays" do
      expect(Aggregate::Values::Array.handles?(1)).to eq false
    end
  end
end
