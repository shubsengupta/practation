class Presentation < ActiveRecord::Base
  #name
  has_one :user
  has_many :slideshow_slides
end