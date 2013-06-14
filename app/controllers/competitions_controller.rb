class CompetitionsController < ApplicationController

  def index
  end

  def new
    @competition = wca.new_competition
  end

  def wca
    CubingAssociation.new name: "World Cube Association"
  end
end
