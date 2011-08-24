module PlansHelper
  
   def plan_list_title(plan_type)
     case plan_type
     when 0
       "Available Plans"
     else
       "Available #{PlanType.find(plan_type)[:name]} Plans"
     end
   end
  
end
