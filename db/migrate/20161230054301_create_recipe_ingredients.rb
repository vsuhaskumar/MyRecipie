class CreateRecipeIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :ingredient_id, :recipe_id
    end
  end
end
