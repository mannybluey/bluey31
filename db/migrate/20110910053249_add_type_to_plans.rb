class AddTypeToPlans < ActiveRecord::Migration
  def up
    add_column :plans, :type, :string
    Plan.all.map {|plan| plan.update_attributes(:type => "#{plan.plan_type[:name]}Plan") }
  end

  def down
    remove_column :plans, :type
  end
  
end
