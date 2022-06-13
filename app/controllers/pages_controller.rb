class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home plan update_cards]
  skip_before_action :verify_authenticity_token

  def home
  end

  def dashboard
    @profile_traits = current_user.profile_traits.order(:user_answer).first(4)
    @profile_traits_empty = @profile_traits.pluck(:user_answer).all?("0")
  end

  def about
  end

  def plan
    user = current_user
    @containers = user.containers

    @container = Container.new
    @card = Card.new
    # container_id = Container.find(params[:container_id])
  end

  # def create_card(container_id)
  #   @container = Container.find(container_id)
  #   @card = Card.new
  #   @card.container = @container
  # end

  def update_cards
    hash = JSON.parse(request.body.read)
    hash.each do |container_id, cards|
      container = Container.find(container_id)
      cards.each_with_index do |card_id, index|
        card = Card.find(card_id)
        card.container = container
        card.position = index
        card.save
      end
    end
  end

  def profile
  end
end
