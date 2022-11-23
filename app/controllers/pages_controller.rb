class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    bookings_details
    athletes_details
  end

  # deux methodes séparées pour enrichir ultérieurement la methode dashboard sans avoir qqch d'illisible
  def bookings_details
    @bookings = current_user.bookings
  end

  def athletes_details
    @athletes = current_user.athletes
  end
end
