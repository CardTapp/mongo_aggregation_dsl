# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Values::Nil do
  describe "#to_s" do
    it "raises if is_key is true" do
      expect { Aggregate::Values::Nil.new(nil, true).to_s }.to raise_error(ArgumentError)
    end

    it "properly formats a nil" do
      expect(Aggregate::Values::Nil.new(nil, false).to_s).to eq "null"
    end
  end

  describe "#handles" do
    it "returns true for nil" do
      expect(Aggregate::Values::Nil.handles?(nil)).to eq true
    end

    it "returns false for non nil" do
      expect(Aggregate::Values::Nil.handles?(1)).to eq false
    end
  end
end
