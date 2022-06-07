class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
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
