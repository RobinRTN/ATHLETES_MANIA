class AthletesController < ApplicationController
  before_action :set_athlete, only: [:show, :edit, :update]

  def index
    @athletes = policy_scope(Athlete)
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
    if @athlete.save
      redirect_to athlete_path(@athlete)
    else
      render :new, status: :unprocessable_entity
    end
    authorize @athlete
  end


  def edit
    authorize @athlete
  end

  def update
    authorize @athlete
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
