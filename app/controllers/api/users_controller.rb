class Api::UsersController < ApplicationController

  def index
    render :json => request.user
  end

  def create
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:pass]
    @user.password_confirmation = params[:pass]
    @user.save
    render 'user'
  end

  def sign_in
    @user = User.find_by_email params[:email]
    if @user && @user.authenticate(params[:pass])
      session[:user_id] = @user.id
      render 'user'
    else
      render :json => nil
    end
  end

  def sign_out
    reset_session
    redirect_to root_path
  end 

  private
  def user_params
    params.require(:user).permit(:email, :pass)
  end
end