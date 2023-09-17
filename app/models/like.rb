class Like < ApplicationRecord
    belongs_to :user
    belongs_to :post
    
    scope :men_only, -> { joins(:user).where(user: { gender: :Men }) }
end
