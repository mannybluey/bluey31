class PlanType < ActiveRecord::Base
  
    has_many :plans
    
  def to_param  # overridden
    name
  end



end
