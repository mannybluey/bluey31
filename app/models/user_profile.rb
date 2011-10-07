class UserProfile < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :user_types
  has_and_belongs_to_many :user_wants
  has_many :user_images, :dependent => :destroy
  has_many :user_goals, :dependent => :destroy
  has_many :user_pains, :dependent => :destroy
  has_many :body_parts, :through => :user_pains
  
  accepts_nested_attributes_for :user_images, :allow_destroy => true,
    :reject_if => proc { |attributes| attributes.all? {|k,v| v.blank?}}
    
  attr_accessible :summary, :gym, :sports, :brands, :dob, :symptoms, :user_type_ids, :user_want_ids, :body_part_ids, :user
  attr_accessible :name, :city, :country, :picture_file_name

  #validates :name, :presence => true, :uniqueness => true, :on => :update
  #validates :city, :presence => true, :on => :update
  #validates :country, :presence => {:message => "not selected..."}, :on => :update
  
  #validate :has_one_user_type_at_least, :on => :update
 # validate :has_one_user_want_at_least, :on => :update
  #validate :has_a_valid_birthday, :on => :update, :if => lambda {|up| up.dob.present? }
  
  def has_one_user_type_at_least
    unless self.user_types.count > 0
      errors[:base] << "You must select one 'I am..' at least"
    end
  end

  def has_one_user_want_at_least
    unless self.user_wants.count > 0
      errors[:base] << "You must select one 'I want..' at least"
    end
  end 

  def has_a_valid_birthday
      unless (Date.today - self.dob.to_date) / 365 > 13
        errors[:base] << "Please check your birthday..."
      end
  end
      
end
# == Schema Information
#
# Table name: user_profiles
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  summary    :text
#  city       :string(255)
#  country    :string(255)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  gym        :string(255)
#  sports     :text
#  brands     :text
#  dob        :date
#  symptoms   :text
#

