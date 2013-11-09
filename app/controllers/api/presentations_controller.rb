class Api::PresentationsController < ApplicationController
  def index
    @presentations = request.user.try(:presentations)
    render 'index'
  end

  def create
    
    if params[:presentation][:type] == 'slide'
      #@presentation.type = "SlidePresentation"
      #@SlidePresentation = SlidePresentation.new("")
    else
      @presentation = TextPresentation.new
      @presentation.user_id = session[:user_id]
      @presentation.text = params[:presentation][:text]
      @presentation.name = params[:presentation][:name]
    @presentation.save
    render 'presentation'
    end
  end 

  def show
    @presentation = Presentation.find params[:id]
    render 'presentation'
  end

  def delete
    Presentation.delete params[:id]
  end

  private
  def presentation_params
    params.require(:presentation).permit(:name)
  end
end