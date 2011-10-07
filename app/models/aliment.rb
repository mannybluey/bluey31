class Aliment < ActiveRecord::Base
  
  belongs_to :meal

  state_machine :initial => :pending do

    event :perform do
      transition :pending => :done
    end
    event :reset do
      transition :done => :pending
    end

  end  
end