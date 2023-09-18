class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :post_and_tags, dependent: :destroy
  has_many :tags, through: :post_and_tags, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :men_likes, -> { joins(:user).where(user: { gender: :Men }) }, class_name: "Like"
  has_many :woman_likes, -> { joins(:user).where(user: { gender: :Woman }) }, class_name: "Like"
  has_many :liked_users, through: :likes, source: :user

  has_one_attached :image
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/Serefy.Logo.png')
      image.attach(io: File.open(file_path), filename: 'Serefy.Logo.png', content_type: 'image/png')
    end
    if image.attached?
       image.variant(resize_to_limit: [width, height]).processed
    end
    # image
  end
  
  def self.search(column_name, search_word)
    where("#{column_name} LIKE ?", "%#{search_word}%")
  end
  
  def liked_by?(user)
    self.likes.exists?(user_id: user.id)
  end
end

  
  # def get_profile_image(width, height)
  #   unless profile_image.attached?
  #     file_path = Rails.root.join('app/assets/images/no_image.jpeg')
  #     profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   end
  #   if profile_image.attached?
  #   # 画像サイズの変更を行う前に、画像が添付されていることを確認する。
  #     profile_image.variant(resize_to_limit: [width, height]).processed
    
  #   # 画像サイズの変更を行う記述
  #   else
  #   end
  # end
