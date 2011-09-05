class PlanItemImage < ActiveRecord::Base
  
  belongs_to :plan_item
  
  validates_presence_of :name
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type=>['image/jpeg', 'image/png', 'image/gif'] 
  
  has_attached_file :image, 
   :styles => { 
     :thumb => '50x60>'
  }
  attr_accessible :image, :name
  
end
