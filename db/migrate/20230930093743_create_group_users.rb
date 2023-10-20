class CreateGroupUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_users do |t|

      t.timestamps
      t.integer :user_id, null:false, foreign_keya: true
      t.integer :group_id, null: false, foreign_key: true
    end
  end
end
