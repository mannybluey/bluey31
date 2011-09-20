class Day < ActiveRecord::Base
  belongs_to :plan
  
  has_many :plan_items, :dependent => :destroy
  has_many :meals, :dependent => :destroy
  
  has_paper_trail
  
  attr_accessible :type
   
end
