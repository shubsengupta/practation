class CreateSlideshowSlides < ActiveRecord::Migration
  def change
    create_table :slideshow_slides do |t|
      t.references :slide_presentation, index: true
      t.string :image
      t.string :text
    end
  end
end
