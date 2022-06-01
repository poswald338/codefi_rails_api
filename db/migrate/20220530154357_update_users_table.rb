class UpdateUsersTable < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :followers, :text, array: true
    add_column :users, :following, :text, array: true
  end
end
