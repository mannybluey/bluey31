class AddWeightAliments < ActiveRecord::Migration
  def up
    change_column :aliments, :name, :string, :default => ''
    change_column :aliments, :calories, :integer, :default => 0
    change_column :aliments, :proteins, :decimal, :default => 0.00
    change_column :aliments, :carbs, :decimal, :default =>  0.00
    change_column :aliments, :fats, :decimal, :default =>  0.00
    add_column :aliments, :qty, :integer, :default => 1
    add_column :aliments, :weight, :integer, :default => 100
  end

  def down
    change_column :aliments, :name, :string
    change_column :aliments, :calories, :integer, :size => 4
    change_column :aliments, :proteins, :integer, :size => 4
    change_column :aliments, :carbs, :integer, :size => 4
    change_column :aliments, :fats, :integer, :size => 4
    remove_column :aliments, :qty
    remove_column :aliments, :weight
  end
end
