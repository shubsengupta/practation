class RemoveExtraTables < ActiveRecord::Migration
  def change
    drop_table :text_presentations
    drop_table :slide_presentations
    add_column :presentations, :text, :text
  end
end
