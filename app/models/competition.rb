require "active_model"

class Competition
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :cubing_association, :name

  def initialize(attributes = {})
    attributes.each do |key, value|
      send("#{key}=", value)
    end
  end

  def publish!
    cubing_association.add_competition self
  end

  def persisted?
    false
  end
end
