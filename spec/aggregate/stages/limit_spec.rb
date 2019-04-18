# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Stages::Group do
  describe "#transpose" do
    it "should properly format" do
      expect(
          Aggregate::Stages::Limit.new(5).transpose
        ).to eq('$limit': 5)
    end
  end
  describe "schema" do
    it "should raise if option is not an integer" do
      expect { Aggregate::Stages::Limit.new("test") }.to raise_error(ParamContractError)
    end
    it "does not raise if option is an integer" do
      expect { Aggregate::Stages::Limit.new(1) }.not_to raise_error
    end
  end
end
