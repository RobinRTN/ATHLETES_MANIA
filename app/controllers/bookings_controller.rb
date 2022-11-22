class BookingsController < ApplicationController
  before_action :set_athlete, only: [:new, :create, :edit, :update]

  def new
    @booking = Booking.new
    authorize @booking
  end

  # add current_user w/ pundit
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.athlete = @athlete
    @booking.status = "pending"
    if @booking.save
      redirect_to athlete_path(@athlete)
    else
      render :new, status: :unprocessable_entity
    end
    authorize @booking
  end

  def edit
    authorize @booking
  end

  def update
    @booking.update
    redirect_to dashboard_path(dashboard)
    authorize @booking
  end

private

  def set_athlete
    @athlete = Athlete.find(params[:athlete_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price, :duration, :status, :user_id)
  end
end
