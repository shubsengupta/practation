class TestsController < ApplicationController
  def index
    render 'index', layout: 'test_layout'
  end
end