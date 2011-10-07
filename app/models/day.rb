class Day < ActiveRecord::Base
  belongs_to :plan
  
  has_many :plan_items, :dependent => :destroy
  has_many :meals, :dependent => :destroy
  
  has_paper_trail
  
  attr_accessible :type, :show_flag

  state_machine :initial => :pending do

    event :perform do
      transition :pending => :completed
    end
    event :reset do
      transition :completed => :pending
    end

  end
     
end
# == Schema Information
#
# Table name: days
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  number     :integer(4)
#  plan_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

