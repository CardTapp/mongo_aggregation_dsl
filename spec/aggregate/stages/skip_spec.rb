# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Stages::Skip do
  describe "#transpose" do
    it "should properly format" do
      expect(
        Aggregate::Stages::Skip.new(5).transpose
      ).to eq('$skip': 5)
    end
  end
  describe "schema" do
    it "should raise if option is not an integer" do
      expect { Aggregate::Stages::Skip.new("test") }.to raise_error(ParamContractError)
    end
    it "does not raise if option is an integer" do
      expect { Aggregate::Stages::Skip.new(1) }.not_to raise_error
    end
  end
end
