require_relative "../../app/models/competition"

describe Competition do
  it "belongs to a cubing association" do
    ca = stub(:cubing_association)
    subject.cubing_association = ca
    expect(subject.cubing_association).to eq(ca)
  end

  it "has a name" do
    c = Competition.new(name: "Karlsruher Open 2020")
    expect(c.name).to eq("Karlsruher Open 2020")
  end

  describe "#publish!" do
    it "adds itself to the cubing association" do
      ca = stub(:cubing_association)
      subject.cubing_association = ca
      ca.should_receive(:add_competition).with(subject)
      subject.publish!
    end
  end
end
