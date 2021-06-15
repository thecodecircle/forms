class AddUuidToForms < ActiveRecord::Migration[6.1]
  def change
    add_column :forms, :uuid, :string
  end
end
