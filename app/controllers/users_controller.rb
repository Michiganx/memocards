class UsersController < ApplicationController

  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.json { render json: @users}
      format.xml { render xml: @users}
    end
  end


  def show
    @user = User.find(params[:id])
    @decks = @user.decks.paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @user}
      format.xml { render xml: @user}
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Memocards"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

end
