class MakePostLikesArray < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :likes, :text, array: true
  end
end
