class CreateRecipis < ActiveRecord::Migration[5.2]
  def change
    create_table :recipis do |t|
      t.string :recipi_title
      t.text :recipi_body
      t.string :image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
