# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Stages::HashBase do
  describe "schema" do
    it "should raise if options is not a hash" do
      expect { Aggregate::Stages::HashBase.new("") }.to raise_error(ParamContractError)
    end

    it "should raise if hash length is zero" do
      expect { Aggregate::Stages::HashBase.new({}) }.to raise_error(ParamContractError)
    end
  end
end
