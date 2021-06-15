class RemoveHtmlFromFormsAddPayload < ActiveRecord::Migration[6.1]
  def change
    remove_column :forms, :html
    add_column :forms, :payload, :json
  end
end
