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
  attr_accessible :name, :city, :country

  validates :name, :presence => true, :uniqueness => true
  
end
