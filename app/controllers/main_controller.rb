class MainController < ApplicationController
  def index
    render 'index', layout: 'application'
  end
end