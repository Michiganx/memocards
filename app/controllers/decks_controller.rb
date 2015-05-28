class DecksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    @deck = Deck.new
  end

  def create
    @deck = current_user.decks.build(deck_params)
    if @deck.save
      flash[:success] = "Deck created!"
      redirect_to @deck
    else
      render 'static_pages/home'
    end
  end


  def show
    @deck = Deck.find(params[:id])
    @cards = @deck.cards.all
    @cards_len = @cards.length
  end

  def edit
    @deck = Deck.find(params[:id])
  end

  def update
    @deck = Deck.find(params[:id])
    @deck.update_attributes(deck_params)
      if @deck.save
        flash[:success] = "Deck updated!"
        redirect_to @deck
      else
        render 'static_pages/home'
      end
  end

  def destroy
    @deck.destroy
    flash[:success] = "Deck deleted"
    redirect_to request.referrer || root_url
  end

  def steal
    @deck_old = Deck.find(params[:id])
    @deck_new = @deck_old.deep_clone
    current_user.decks << @deck_new

    redirect_to current_user

    # @experiment_new = @experiment_old.clone
    # @experiment_old.trials.each do |trial|
    #   @experiment_new.trials << trial.clone
    # end
  end

  private

  def deck_params
    params.require(:deck).permit(:description, :name, cards_attributes:[ :sidea, :sideb, :id, :_destroy])
  end

  def correct_user
    @deck = current_user.decks.find_by(id: params[:id])
    redirect_to root_url if @deck.nil?
  end

end
