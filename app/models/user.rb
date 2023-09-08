class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

# database_authenticatable...パスワードの正確性を検証
# registerable...ユーザー登録や編集、削除
# recoverable...パスワードをリセット
# rememberable...ログイン情報を保存
# validatable...emailのフォーマットなどのバリデーション
