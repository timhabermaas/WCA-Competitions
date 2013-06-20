class CubingAssociation
  attr_accessor :name
  attr_writer :competition_builder

  def initialize(attributes = {})
    @name = attributes[:name]
    @competitions = []
  end

  def new_competition(attributes = {})
    competition_builder.call(attributes).tap do |c|
      c.cubing_association = self
    end
  end

  def competitions
    @competitions
  end

  def add_competition(competition)
    competitions << competition
  end

  private
  def competition_builder
    @competition_builder ||= Competition.public_method(:new)
  end
end
