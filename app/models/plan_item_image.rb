class PlanItemImage < ActiveRecord::Base
  
  belongs_to :plan_item
  
  validates_presence_of :name
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type=>['image/jpeg', 'image/png', 'image/gif'] ,
   :message => ": jpeg, png or gif only" , :if => Proc.new { |imports| !imports.image_file_name.blank? }
  validates_attachment_size :image, :less_than=>1.megabyte,  :if => Proc.new { |imports| !imports.image_file_name.blank? }
  
  has_attached_file :image, 
   :styles => { 
     :thumb => '50x60>'
  }
  attr_accessible :image, :name
  
end
# == Schema Information
#
# Table name: plan_item_images
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  plan_item_id       :integer(4)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

