class Category < ApplicationRecord
  has_many :recipe_category_relations
  has_many :recipes, through: :recipe_category_relations
end
