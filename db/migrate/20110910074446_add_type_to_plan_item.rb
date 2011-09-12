class AddTypeToPlanItem < ActiveRecord::Migration
  def up
    add_column :plan_items, :type, :string
    PlanItem.all.map {|plan_item| plan_item.update_attributes(:type => "PlanItem#{plan_item.day.plan.plan_type[:name]}") }
  end

  def down
    remove_column :plan_items, :type
  end
  
end
