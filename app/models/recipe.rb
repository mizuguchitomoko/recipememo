class Recipe < ApplicationRecord
  belongs_to :user
  attachment :image
  default_scope->{order(created_at: :desc)}
  has_many :favorites

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
