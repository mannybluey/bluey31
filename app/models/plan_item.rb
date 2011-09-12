class PlanItem < ActiveRecord::Base
  
  belongs_to :day
  
  has_many :plan_item_sets
  
  has_one :plan_item_image, :dependent => :destroy

  attr_accessible :type

  validates_presence_of :name

  accepts_nested_attributes_for :plan_item_sets, :allow_destroy => true,
    :reject_if => proc { |attributes| attributes.all? {|k,v| v.blank?}}
  has_paper_trail
  
end
