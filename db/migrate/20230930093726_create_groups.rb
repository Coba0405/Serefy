class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|

      t.timestamps
      t.integer :genre_id, null: false
      t.string :group_name, null: false
      t.string :introduction
      t.integer :owner_id, null: false
      t.text :message
      t.string :image
      t.references :user, foreign_key: true
    end
  end
end
