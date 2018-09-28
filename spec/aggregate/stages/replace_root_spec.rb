# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Stages::ReplaceRoot do
  describe "#transpose" do
    it "should properly format" do
      expect(Aggregate::Stages::ReplaceRoot.new("$test").transpose).to eq('$replaceRoot': { 'newRoot': "$test" })
    end
  end
  describe "schema" do
    it "should raise if the value is not a string" do
      expect { Aggregate::Stages::ReplaceRoot.new({}) }.to raise_error(ParamContractError)
    end
    it "should raise if the value does not start with $" do
      expect { Aggregate::Stages::ReplaceRoot.new("test") }.to raise_error(ParamContractError)
    end
  end
end
