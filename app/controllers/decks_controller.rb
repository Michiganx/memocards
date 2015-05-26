class DecksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @deck = current_user.decks.build(deck_params)
    if @deck.save
      flash[:success] = "Deck created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def show

  end

  def destroy
  end

  private

  def deck_params
    params.require(:deck).permit(:description)
  end

end
