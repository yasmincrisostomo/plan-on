class CardsController < ApplicationController
  before_action :set_card, only: %i[show edit update destroy]

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.user = current_user

    if @card.save
      redirect_to plan_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to plan_path
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to plan_path
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :description)
  end
end
