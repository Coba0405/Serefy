class Genre < ApplicationRecord
  has_many :posts, dependent: :destroy
#postモデルと関連し、複数の投稿を持つことができるようになる。
  validates :name, presence: true
#「validates :name」でnameカラムに対してバリデーションルールを設定するの意味
# 上記記述のバリデーションルールは「presence: true」が該当していてデータベースへ保存するときはnameが必ず値を持っていなければならないという制約ができる。（値が空,nilが指定できない）
end
