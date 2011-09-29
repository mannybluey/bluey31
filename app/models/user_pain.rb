class UserPain < ActiveRecord::Base
  belongs_to :user_profile
  belongs_to :body_part

  attr_accessible :body_part_id
end
# == Schema Information
#
# Table name: user_pains
#
#  id              :integer(4)      not null, primary key
#  user_profile_id :integer(4)
#  body_part_id    :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

