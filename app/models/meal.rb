class Meal < ActiveRecord::Base
  
  belongs_to :day
  
  has_many :aliments, :dependent => :destroy
    
  attr_accessible :name, :aliments_attributes

  validates_presence_of :name
      
  accepts_nested_attributes_for :aliments, :allow_destroy => true,
    :reject_if => proc { |attributes| attributes.all? {|k,v| v.blank?}}
    
  has_paper_trail
 
end# == Schema Information
#
# Table name: meals
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  day_id     :integer(4)
#  position   :integer(4)
#  completed  :boolean(1)      default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

