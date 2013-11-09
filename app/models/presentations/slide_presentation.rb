class SlidePresentation < Presentation
  has_one :presentation, autosave: true
  has_many :slideshow_slides
end