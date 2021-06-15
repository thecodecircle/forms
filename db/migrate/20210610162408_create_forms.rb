class CreateForms < ActiveRecord::Migration[6.1]
  def change
    create_table :forms do |t|
      t.string :url
      t.text :html
      t.string :creator

      t.timestamps
    end
  end
end
