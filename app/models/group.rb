class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  # ownerは'User'モデルと関連し、:class_nameを使用して関連するクラスを指定。
  # これによりGroupモデルは所有者としてのuserを持つ事ができる
  belongs_to :genre
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users, source: :user
  # source:オプションを使用して関連するUserレコードがどのテーブルから取得さるかを指定
  has_many :group_masseges, dependent: :destroy
  
  validates :group_name, presence: true
  # presenceで:name属性がからでないことを確認する
  validates :introduction, presence: true
  has_one_attached :image
  
  def is_owned_by?(user)
    owner.id == user.id
  end
  
  def get_image
    (image.attached?) ? image : 'Serefy.Logo.png'
  end
end
