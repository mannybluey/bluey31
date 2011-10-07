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

# == Schema Information
#
# Table name: aliments
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  calories   :integer(4)
#  proteins   :integer(4)
#  carbs      :integer(4)
#  fats       :integer(4)
#  meal_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

