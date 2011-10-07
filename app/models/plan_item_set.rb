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
