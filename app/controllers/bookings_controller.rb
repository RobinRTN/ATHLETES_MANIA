class BookingsController < ApplicationController
  before_action :set_athlete, only: [:create, :edit, :update]

  def new
    @booking = Booking.new
  end

  # add current_user w/ pundit
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.save
    redirect_to athlete_path(@athlete)
  end

  def edit
  end

  def update
    @booking.update
    redirect_to dashboard_path(dashboard)
  end

private

  def set_athlete
    @athlete = Athlete.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price, :duration, :status, :user_id)
  end
end
