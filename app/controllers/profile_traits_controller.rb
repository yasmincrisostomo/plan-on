class ProfileTraitsController < ApplicationController
  def create
    @profile_trait = ProfileTraits.new(profile_trait_params)
    @profile_trait.user = current_user

    @profile_trait.save
  end

  def update
    @profile_trait = ProfileTrait.find(params[:id])
    @profile_trait.update(profile_trait_params)
  end

  private

  def profile_trait_params
    params.require(:profile_trait).permit(:user_answer, :trait_id)
  end
end
