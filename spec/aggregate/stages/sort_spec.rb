# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Stages::Sort do
  it "raises if value is not a hash" do
    expect do
      Aggregate::Stages::Sort.new("test")
    end.to raise_error(ParamContractError)
  end

  it "raises if hash is empty" do
    expect do
      Aggregate::Stages::Sort.new({})
    end.to raise_error(ParamContractError)
  end

  describe "#transpose" do
    it "should properly format" do
      expect(
          Aggregate::Stages::Sort.new(created_at: 1).transpose
      ).to eq('$sort': { created_at: 1 })
    end
  end
end
