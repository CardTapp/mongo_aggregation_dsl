# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Contracts::CollectionExists do
  describe "#valid?" do
    it "is true if the collection exists" do
      contract = Aggregate::Contracts::CollectionExists.new
      collections = [double(name: "should_exist", present?: true)]
      allow(Mongoid).to receive_message_chain(:default_client, :collections).and_return(collections)
      expect(contract.valid?("should_exist")).to eq true
    end
    it "is false if collection does not exist" do
contract = Aggregate::Contracts::CollectionExists.new
      collections = [double(name: "should_exist", present?: true)]
      allow(Mongoid).to receive_message_chain(:default_client, :collections).and_return(collections)
      expect(contract.valid?("should_not_exist")).to eq false
    end
  end
end