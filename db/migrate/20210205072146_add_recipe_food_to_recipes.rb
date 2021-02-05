class AddRecipeFoodToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :recipe_food, :string
  end
end
