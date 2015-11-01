class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'Your are registred!'
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong.'
      render :new
    end
  end

  def show
  end

  def edit; end

  def update
    if @user.update(user_params)
      falsh[:notice] = 'Your information has been updated.'
      redirect to root_path
    else
      flash[:error] = 'Something went wrong'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def set_user
    @user = User.find_by slug: params[:id]
  end

  def require_same_user
    if current_user != @user
      flash[:error] = 'You are not allowed to do that.'
      redirect_to root_path
    end
  end
end