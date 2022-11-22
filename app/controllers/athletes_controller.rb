class AthletesController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update]

  def index
    @athletes = Athlete.all
  end

  def show
    authorize @athlete
  end

  def new
    @athlete = Athlete.new
    authorize @athlete
  end

  def create
    @athlete = Athlete.new(athlete_params)
    @athlete.user = current_user
    @athlete.save
    raise
    authorize @athlete


  def edit
  end

  def update
    @athlete.update(athlete_params)
    redirect_to athlete_path(@athlete)
  end

  private

  def athlete_params
    params.require(:athlete).permit(:first_name, :last_name, :price_per_day, :age, :location, :summary, :features, :sport)
  end

  def set_athlete
    @athlete = Athlete.find(params[:id])
  end
end
