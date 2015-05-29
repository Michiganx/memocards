class CardsController < ApplicationController
=begin

  def index
    @cards =
    if params.has_key? :deck_id
      Deck.find(params[:deck_id]).cards.all
    else
      Card.all
    end

    respond_to do |format|
      format.json { render json: @cards}
      format.xml { render xml: @cards}
    end

  end

  def show
    @card = Card.find(params[:id])
    respond_to do |format|
      format.json { render json: @card}
      format.xml { render xml: @card}
    end
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def card_params
    params.require(:card).permit(:sidea, :sideb)

  end
=end
end
