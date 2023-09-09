class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    # database_authenticatable...パスワードの正確性を検証
    # registerable...ユーザー登録や編集、削除
    # recoverable...パスワードをリセット
    # rememberable...ログイン情報を保存
    # validatable...emailのフォーマットなどのバリデーション
    
  enum gender: { Men: 0, Woman: 1 }
  enum age_groups: { Early_10s: 0, Late_10s: 1, Early_20s: 2, Late_20s: 3, Early_30s: 4, Late_30s: 5, Early_40s: 6, Late_40s: 7, In_the_50s: 8, Beyond_the_60s: 9 }

end

