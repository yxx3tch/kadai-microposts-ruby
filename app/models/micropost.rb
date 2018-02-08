class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :favorites, class_name: 'Favorite', foreign_key: 'favorite_id'
  has_many :favoriting_users, through: :favorites, source: :user
  
  def remove_favorites
    favorite = self.favorites.find_by(favorite_id: self.id)
    favorite.destroy if favorite
  end
end
