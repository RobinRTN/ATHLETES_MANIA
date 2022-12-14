class BookingsController < ApplicationController
  before_action :set_athlete, only: [:new, :create]
  before_action :set_athlete_edit, only: [:edit, :update]

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
    authorize @booking
    if @booking.save
      redirect_to dashboard_path
    else
      render "athlete/:id", status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to dashboard_path(@dashboard)
    authorize @booking
  end

  def accept
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(status: "accepted")
    redirect_to dashboard_path
  end

  def refuse
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(status: "refused")
    redirect_to dashboard_path
  end

  def cancel
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(status: "canceled")
    redirect_to dashboard_path
  end

private

  def set_athlete
    @athlete = Athlete.find(params[:athlete_id])
  end

  def set_athlete_edit
    @athlete = Booking.find(params[:id]).athlete
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price, :duration, :status, :user_id)
  end
end
