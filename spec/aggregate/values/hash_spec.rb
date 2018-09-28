# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Values::Hash do
  describe "#transpose" do
    it "raises if is_key is true" do
      expect { Aggregate::Values::Hash.new([]).to_s }.to raise_error(ArgumentError)
    end

    it "properly formats a hash" do
      expect(Aggregate::Values::Hash.new({ test: "test" }, false).transpose).to eq('test': "test")
    end
  end

  describe "#handles" do
    it "returns true for Hash" do
      expect(Aggregate::Values::Hash.handles?({})).to eq true
    end

    it "returns false for non Hash" do
      expect(Aggregate::Values::Hash.handles?(1)).to eq false
    end
  end
end
