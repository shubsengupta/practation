class SlideshowSlide < ActiveRecord::Base
  #image, #text
  belongs_to :slide_presentation
end