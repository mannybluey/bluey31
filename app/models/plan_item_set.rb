class PlanItemSet < ActiveRecord::Base

  belongs_to :plan_item

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
# Table name: plan_item_sets
#
#  id           :integer(4)      not null, primary key
#  measurements :string(255)
#  plan_item_id :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

