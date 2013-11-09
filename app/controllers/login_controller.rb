class LoginController < ApplicationController
  def index
    if request.user
      redirect_to dashboard_path
    else
      render 'index', layout: 'login'
    end
  end
end