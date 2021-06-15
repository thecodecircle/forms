class AddFontToForms < ActiveRecord::Migration[6.1]
  def change
    add_column :forms, :font, :integer
  end
end
