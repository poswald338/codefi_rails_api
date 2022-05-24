class UpdateBioName < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :bi0
    add_column :users, :bio, :text
  end
end
