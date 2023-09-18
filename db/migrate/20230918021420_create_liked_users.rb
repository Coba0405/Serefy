class CreateLikedUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :liked_users do |t|

      t.timestamps
      t.bigint :post_id
      t.bigint :user_id
    end
  end
end
