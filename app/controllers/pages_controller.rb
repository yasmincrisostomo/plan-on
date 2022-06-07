class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
  end

  def about
  end

  def plan
  end

  def profile
    @profile_traits = current_user.profile_traits
  end
end
