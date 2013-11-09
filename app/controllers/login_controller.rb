class LoginController < ApplicationController
  def index
    render 'index', layout: 'login'
  end
end