class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  
  has_one_attached :image
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/Serefy.Logo.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    if image.attached?
      image.variant(resize_to_limit: [width, height]).processed
    else
    end
    image
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
end