class Day < ActiveRecord::Base
  belongs_to :plan
  has_many :plan_items
  has_paper_trail
  
  attr_accessible :type
   
end
