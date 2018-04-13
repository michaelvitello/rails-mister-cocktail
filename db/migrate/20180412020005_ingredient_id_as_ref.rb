class IngredientIdAsRef < ActiveRecord::Migration[5.1]
  def change
    add_reference :doses, :ingredient_id, index: true
  end
end
