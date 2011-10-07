class UserImage < ActiveRecord::Base
  belongs_to :user_profile
  validates_presence_of :name
  validates_attachment_presence :picture
  has_attached_file :picture,
    :styles => {
      :large => '80x80#',
      :badge => '30x30'
    },
    :default_style => :large
  attr_accessible :picture, :name, :is_profile_picture
end
# == Schema Information
#
# Table name: user_images
#
#  id                   :integer(4)      not null, primary key
#  name                 :string(255)
#  user_profile_id      :integer(4)
#  created_at           :datetime
#  updated_at           :datetime
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer(4)
#  picture_updated_at   :datetime
#  is_profile_picture   :boolean(1)      default(FALSE)
#

