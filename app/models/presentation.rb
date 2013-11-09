class Presentation < ActiveRecord::Base
  #name
  has_one :user
end