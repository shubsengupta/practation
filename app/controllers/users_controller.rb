class UsersController < ApplicationController
  def index
    if request.user
      #redirect
    end
  end

  def sign_in
    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
       render :json => user
    end
    else
      render :json => nil
    end
  end

  def sign_out
    reset_session
    redirect_to root_path
  end 

end