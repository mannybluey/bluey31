class PlanType < ActiveRecord::Base
  
    has_many :plans
    

  class << self
    def implemented
       where(:status => true)
    end
  end
  

end
