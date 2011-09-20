class Meal < ActiveRecord::Base
  
  belongs_to :day
  
  has_many :aliments, :dependent => :destroy
    
  attr_accessible :name, :aliments_attributes

  validates_presence_of :name
      
  accepts_nested_attributes_for :aliments, :allow_destroy => true,
    :reject_if => proc { |attributes| attributes.all? {|k,v| v.blank?}}
    
  has_paper_trail
 
end