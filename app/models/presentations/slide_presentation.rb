class SlidePresentation < ActiveRecord::Base
  has_one :presentation, autosave: true
  has_many :slideshow_slides
end