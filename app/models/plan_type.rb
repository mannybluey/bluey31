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
# == Schema Information
#
# Table name: plan_types
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  image_path :string(255)
#  position   :integer(4)
#  status     :boolean(1)      default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#

