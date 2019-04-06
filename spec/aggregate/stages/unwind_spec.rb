# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Stages::Unwind do
  describe "#transpose" do
    it "should properly format a simple unwind" do
      expect(Aggregate::Stages::Unwind.new("$test").transpose).to eq('$unwind': "$test")
    end
    it "should properly format an advanced unwind" do
      expect(Aggregate::Stages::Unwind.new(
          path:                       "$my_path",
          preserveNullAndEmptyArrays: true,
          includeArrayIndex:          "index_column"
        ).transpose).
          to eq('$unwind': { 'path': "$my_path", 'preserveNullAndEmptyArrays': true, 'includeArrayIndex': "index_column" })
    end
  end
  describe "schema" do
    describe "basic unwind" do
      it "should raise if the value is not a string" do
        expect { Aggregate::Stages::Unwind.new([]) }.to raise_error(ParamContractError)
      end
      it "should raise if the value does not start with $" do
        expect { Aggregate::Stages::Unwind.new("test") }.to raise_error(ParamContractError)
      end
      it "should not raise if provide a valid string value" do
        expect { Aggregate::Stages::Unwind.new("$test") }.not_to raise_error
      end
    end
    describe "advanced unwind" do
      it "should raise if the value is not an array" do
        expect { Aggregate::Stages::Unwind.new([]) }.to raise_error(ParamContractError)
      end

      describe "options" do
        it "should raise if a path is not provided" do
          expect { Aggregate::Stages::Unwind.new({}) }.to raise_error(ParamContractError)
        end
        it "should raise if the path does not start with a $" do
          expect { Aggregate::Stages::Unwind.new(path: "test") }.to raise_error(ParamContractError)
        end
        it "should not raise if a valid path is provided" do
          expect { Aggregate::Stages::Unwind.new(path: "$test") }.not_to raise_error
        end
        it "can accept includeArrayIndex" do
          expect { Aggregate::Stages::Unwind.new(path: "$test", includeArrayIndex: "index_column") }.not_to raise_error
        end
        it "should raise if includeArrayIndex is not a bool" do
          expect { Aggregate::Stages::Unwind.new(path: "$test", includeArrayIndex: 1) }.to raise_error(ParamContractError)
        end
        it "can accept preserveNullAndEmptyArrays" do
          expect { Aggregate::Stages::Unwind.new(path: "$test", preserveNullAndEmptyArrays: true) }.not_to raise_error
        end
        it "should raise if preserveNullAndEmptyArrays is not a bool" do
          expect { Aggregate::Stages::Unwind.new(path: "$test", preserveNullAndEmptyArrays: 1) }.to raise_error(ParamContractError)
        end
        it "should raise if any other key is provided" do
          expect { Aggregate::Stages::Unwind.new(path: "test", my_key: "test") }.to raise_error(ParamContractError)
        end
      end
    end
  end
end
