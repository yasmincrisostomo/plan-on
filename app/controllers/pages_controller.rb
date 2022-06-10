class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home plan update_cards]
  skip_before_action :verify_authenticity_token

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
    @profile_traits = current_user.profile_traits
  end
end
