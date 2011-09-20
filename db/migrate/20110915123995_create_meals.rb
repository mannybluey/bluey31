class CreateMeals < ActiveRecord::Migration
  def up
    create_table :meals, :force => true do |t|
      t.string   :name
      t.integer  :day_id, :position
      t.boolean  :completed,  :default => false
      t.timestamps
    end
  end

  def down
    drop_table :meals
  end
end