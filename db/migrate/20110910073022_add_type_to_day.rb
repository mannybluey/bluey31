class AddTypeToDay < ActiveRecord::Migration
  def up
    add_column :days, :type, :string
    Day.all.map {|day| day.update_attributes(:type => "Day#{day.plan.plan_type[:name]}") }
  end

  def down
    remove_column :days, :type
  end
  
end
