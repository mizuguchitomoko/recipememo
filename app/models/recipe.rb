class Recipe < ApplicationRecord
  belongs_to :user
  attachment :image
  default_scope->{order(created_at: :desc)}
  has_many :favorites
  has_many :recipe_comments, dependent: :destroy
  has_many :recipe_category_relations
  has_many :categories, through: :recipe_category_relations

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
