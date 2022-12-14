class ReviewsController < ApplicationController

  def index
    @review = policy_scope(Review)
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @athlete = Athlete.find(@booking.athlete_id)
    @review = Review.new
    authorize @review

    @reviews = @athlete.reviews
    # @athlete.reviews
  end

  # add current_user w/ pundit
  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
