class ProfilesController < ApplicationController
  def edit
  end

  def update
    @user = current_user
    @user.update!(user_params)
    redirect_to profiles_path
  end

  def show
    @hash = {}
    current_user.profile_traits.each do |pro|
      @hash[pro.trait.name] = pro.user_answer
    end
  end

  private

  def user_params
    params.require(:user).permit(profile_traits_attributes: [:user_answer, :id])
  end
end
