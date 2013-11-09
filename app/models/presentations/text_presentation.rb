class TextPresentation < ActiveRecord::Base
  #text
  has_one :presentation, autosave:true
end