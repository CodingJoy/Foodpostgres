class AddFoodIdToInputs < ActiveRecord::Migration
  def change
    add_column :inputs, :food_id, :integer
  end
end
