class PlanType < ActiveRecord::Base
  
    has_many :plan
    
    validates_presence_of :image_path
    validates_numericality_of :position
    

  class << self
    def implemented
       where(:status => true)
    end
  end
  

end
