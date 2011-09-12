class AddTypeToPlanItemSet < ActiveRecord::Migration
  def up
    add_column :plan_item_sets, :type, :string
    PlanItemSet.all.map {|plan_item_set| plan_item_set.update_attributes(:type => "PlanItemSet#{plan_item_set.plan_item.day.plan.plan_type[:name]}") }
  end

  def down
    remove_column :plan_item_sets, :type
  end
  
end
