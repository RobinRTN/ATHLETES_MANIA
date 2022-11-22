class AthletesController < ApplicationController
  def index
    @athletes = Athlete.all
  raise
  end

  def show
    @athlete = Athlete.find(params[:id])
  end
end
