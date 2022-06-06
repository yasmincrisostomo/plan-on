class ProfileTraitsController < ApplicationController
  def index
    @profile_traits = ProfileTraits.all
  end

  def show
    @profile_trait = ProfileTraits.find(params[:id])
  end

  def new
    @profile_trait = ProfileTraits.new
  end

  def create
    @profile_trait = ProfileTraits.new(profile_trait_params)
    @profile_trait.user = current_user

    @profile_trait.save
  end

  def edit
    @profile_trait = ProfileTraits.find(params[:id])
  end

  def update
    @profile_trait.update(profile_trait_params)
  end

  private

  def profile_trait_params
    params.require(:profile_trait).permit(:user_answer, :user_id, :trait_id)
  end
end
