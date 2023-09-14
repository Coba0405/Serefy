class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.timestamps
      
      t.text "title", null: false
      t.text "body", null: false
      t.string "tag"
      t.integer "user_id"
      t.integer "genre_id"
    end
  end
end
