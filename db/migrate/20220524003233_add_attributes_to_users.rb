class AddAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name
    add_column :users, :human_name, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :zip, :string
    add_column :users, :pet_name, :string
    add_column :users, :pet_nickname, :string
    add_column :users, :breed, :string
    add_column :users, :birthday, :datetime
    add_column :users, :bi0, :text
  end
end
