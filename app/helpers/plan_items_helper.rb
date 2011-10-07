module PlanItemsHelper
  
  def should_display?(plan_item)
    return 'visible' unless plan_item.completed?
    return plan_item.day[:show_flag] ? 'visible' : 'none'
  end
  
end

