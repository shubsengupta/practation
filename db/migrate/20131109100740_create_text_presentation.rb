class CreateTextPresentation < ActiveRecord::Migration
  def change
    create_table :text_presentations do |t|
      t.references :presentation, index: true
      t.string :text
    end
  end
end
