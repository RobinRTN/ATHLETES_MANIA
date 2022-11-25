class AthletesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_athlete, only: [:show, :edit, :update]

  include CloudinaryHelper

  def index
    if params[:query].present?
      @athletes = policy_scope(Athlete).search_by_athlete(params[:query])
    else
      @athletes = policy_scope(Athlete)
    end
    @markers = @athletes.geocoded.map do |athlete|
      {
        lat: athlete.latitude,
        lng: athlete.longitude,
        id: athlete.id,
        image_url: cl_image_path(athlete.photo.key)
      }
    end
  end

  def show
    authorize @athlete
    # authorize @booking
    @reviews = @athlete.reviews
    @booking = Booking.new(athlete_id: @athlete.id)
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
      redirect_to dashboard_path(@athlete)
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
    redirect_to dashboard_path(@athlete)
  end

  private

  def athlete_params
    params.require(:athlete).permit(:first_name, :last_name, :price_per_day, :age, :location, :summary, :features, :sport, :photo, :availability, :gender)
  end

  def set_athlete
    @athlete = Athlete.find(params[:id])
  end
end
