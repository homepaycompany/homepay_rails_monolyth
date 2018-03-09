class AddTokenToPropertyForms < ActiveRecord::Migration[5.1]
  def change
    add_column :property_forms, :token, :string
  end
end
