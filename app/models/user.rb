class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_many :posts, dependent: :destroy
  
  has_one_attached :profile_image
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    # database_authenticatable...パスワードの正確性を検証
    # registerable...ユーザー登録や編集、削除
    # recoverable...パスワードをリセット
    # rememberable...ログイン情報を保存
    # validatable...emailのフォーマットなどのバリデーション
    
  enum gender: { Men: 0, Woman: 1 }
  enum age_groups: { Early_10s: 0, Late_10s: 1, Early_20s: 2, Late_20s: 3, Early_30s: 4, Late_30s: 5, Early_40s: 6, Late_40s: 7, In_the_50s: 8, Beyond_the_60s: 9 }

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    if profile_image.attached?
    # 画像サイズの変更を行う前に、画像が添付されていることを確認する。
    profile_image.variant(resize_to_limit: [width, height]).processed
    
    # 画像サイズの変更を行う記述
    else
    end
  end
end

