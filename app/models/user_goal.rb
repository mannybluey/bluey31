class UserGoal < ActiveRecord::Base
  belongs_to :body_part
  belongs_to :user_profile

  validates :current_value,
    :format => { :with => /^\d+??(?:\.\d{0,2})?$/ },
    :numericality => {:greater_than => 0},
    :allow_nil => true
  validates :goal_value,
    :format => { :with => /^\d+??(?:\.\d{0,2})?$/ },
    :numericality => {:greater_than => 0},
    :allow_nil => true

  attr_accessible :current_value, :goal_value, :is_goal
end
# == Schema Information
#
# Table name: user_goals
#
#  id              :integer(4)      not null, primary key
#  name            :string(255)
#  current_value   :decimal(16, 2)
#  goal_value      :decimal(16, 2)
#  unit            :string(255)
#  is_goal         :boolean(1)      default(FALSE)
#  created_at      :datetime
#  updated_at      :datetime
#  user_profile_id :integer(4)
#  body_part_id    :integer(4)
#

