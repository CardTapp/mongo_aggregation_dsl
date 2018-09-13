# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Stages::Unwind do
  describe "#to_s" do
    it "should properly format" do
      expect(Aggregate::Stages::Unwind.new("$test").to_s).to eq "{ $unwind: '$test' }"
    end
  end
  describe "schema" do
    it "should raise if the value is not a string" do
      expect { Aggregate::Stages::Unwind.new({}) }.to raise_error(ParamContractError)
    end
    it "should raise if the value does not start with $" do
      expect { Aggregate::Stages::Unwind.new("test") }.to raise_error(ParamContractError)
    end
  end
end
