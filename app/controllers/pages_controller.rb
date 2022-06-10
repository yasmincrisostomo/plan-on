class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @profile_traits = current_user.profile_traits.order(:user_answer).first(4)
    @profile_traits_empty = @profile_traits.pluck(:user_answer).all?("0")
  end

  def about
  end

  def plan
    @containers = Container.all
    @cards = Card.all
  end

  def profile
  end
end
