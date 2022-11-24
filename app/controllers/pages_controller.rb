class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @user = current_user
    user_bookings_details
    user_athletes_details
    user_rentals_details
  end

  # deux methodes séparées pour enrichir ultérieurement la methode dashboard sans avoir qqch d'illisible
  def user_bookings_details
    @bookings = current_user.bookings
  end

  def user_athletes_details
    @user_athletes = current_user.athletes
  end

  def user_rentals_details
    user_athletes = current_user.athletes
    @user_rentals = []
    user_athletes.each do |athlete|
      athlete.bookings.each do |booking|
        @user_rentals << booking
      end
    end
    return @user_rentals
  end
end
