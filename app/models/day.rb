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
