class CreatePresentation < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
