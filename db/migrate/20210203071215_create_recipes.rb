class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :recipe_title
      t.text :recipe_body
      t.string :image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
