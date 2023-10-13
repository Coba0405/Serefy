class CreateChatUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_users do |t|

      t.timestamps
      t.integer :user_id, null: false
      t.integer :chat_id, null: false
      t.integer :genre_id, null: false
    end
  end
end
