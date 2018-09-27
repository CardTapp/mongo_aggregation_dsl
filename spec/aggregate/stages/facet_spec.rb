# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Stages::Facet do
  describe "#transpose" do
    it "should properly format" do
      expect(Aggregate::Stages::Facet.new(
        testa: Aggregate::Pipeline.new,
        testb: Aggregate::Pipeline.new
      ).transpose).to eq('$facet': { 'testa': [], 'testb': [] })
    end
  end

  describe "schema" do
    it "should raise if hash length is zero" do
      expect { Aggregate::Stages::Facet.new({}) }.to raise_error(ParamContractError)
    end
    it "should not raise if values are a Pipeline" do
      expect do
        Aggregate::Stages::Facet.new(
          testa: Aggregate::Pipeline.new,
          testb: Aggregate::Pipeline.new
        ).transpose
      end .not_to raise_error
    end
    it "should raise if values are not a Pipeline" do
      expect do
        Aggregate::Stages::Facet.new(
          testa: Aggregate::Pipeline.new,
          testb: "test"
        ).transpose
      end .to raise_error(ParamContractError)
    end
  end
end
