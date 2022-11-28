class AddFirstNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :about, :text
    add_column :users, :level, :integer
    add_column :users, :zip_code, :string
    add_column :users, :country, :string
  end
end
