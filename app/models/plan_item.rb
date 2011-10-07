class PlanItem < ActiveRecord::Base
  
  belongs_to :day
  
  has_many :plan_item_sets, :dependent => :destroy
  
  has_one :plan_item_image, :dependent => :destroy
  
  attr_accessible :name, :plan_item_sets_attributes

  validates_presence_of :name

  accepts_nested_attributes_for :plan_item_sets, :allow_destroy => true,
    :reject_if => proc { |attributes| attributes.all? {|k,v| v.blank?}}
    
  has_paper_trail
  
end
# == Schema Information
#
# Table name: plan_items
#
#  id         :integer(4)      not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  day_id     :integer(4)
#  position   :integer(4)
#  completed  :boolean(1)      default(FALSE)
#  name       :string(255)
#

