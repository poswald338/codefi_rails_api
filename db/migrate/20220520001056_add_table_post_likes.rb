class AddTablePostLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :post_likes do |t|
      t.references :post, null: false, foreign_key: true 
      t.references :like, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
