class PlanItemSet < ActiveRecord::Base
  
  belongs_to :plan_item

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

