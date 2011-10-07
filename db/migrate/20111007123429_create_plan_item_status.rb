class CreatePlanItemStatus < ActiveRecord::Migration
  def up
    add_column :days, :state, :string, :default => :pending
    add_column :plan_items, :state, :string, :default => :pending
    add_column :meals, :state, :string, :default => :pending
  end

  def down
    remove_column :days, :state
    remove_column :plan_items, :state
    remove_column :meals, :state
  end
end
