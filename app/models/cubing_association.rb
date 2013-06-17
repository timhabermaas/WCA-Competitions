class CubingAssociation
  attr_accessor :name
  attr_writer :competition_builder

  def initialize(attributes = {})
    @name = attributes[:name]
  end

  def new_competition
    competition_builder.call
    competition_builder.call.tap do |c|
      c.cubing_association = self
    end
  end

  private
  def competition_builder
    @competition_builder ||= Competition.public_method(:new)
  end
end
