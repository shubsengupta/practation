class CreateSlidePresentation < ActiveRecord::Migration
  def change
    create_table :slide_presentations do |t|
      t.references :presentation, index: true
    end
  end
end
