class CreateAliments < ActiveRecord::Migration
  def up
    create_table :aliments, :force => true do |t|
      t.string   :name
      t.integer :calories
      t.integer :proteins, :carbs, :fats
      t.integer  :meal_id
      t.timestamps
    end
  end

  def down
    drop_table :aliments
  end
end
