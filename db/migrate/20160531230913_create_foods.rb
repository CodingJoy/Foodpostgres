class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.text :description
      t.string :creator

      t.timestamps null: false
    end
  end
end
