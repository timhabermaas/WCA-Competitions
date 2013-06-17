require_relative "../../app/models/cubing_association"
require "ostruct"

describe CubingAssociation do
  describe "attributes" do
    it "defaults to nil for name" do
      expect(CubingAssociation.new.name).to be_nil
    end

    it "has a name" do
      cubing_association = CubingAssociation.new name: "World Cube Association"
      expect(cubing_association.name).to eq("World Cube Association")
    end
  end

  describe "#new_competition" do
    let(:competition) { OpenStruct.new }

    before do
      subject.competition_builder = lambda { competition }
    end

    it "returns a new competition object" do
      expect(subject.new_competition).to eq(competition)
    end

    it "returns a new competition object which knows about its cubing association" do
      expect(subject.new_competition.cubing_association).to eq(subject)
    end
  end
end
