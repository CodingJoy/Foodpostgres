class AddReceipeToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :directions, :text
  end
end
