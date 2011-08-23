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

  attr_accessible :title, :first_name, :middle_name , :last_name , :time_zone, :address, :zip_code, :state_area_region, :country


  ASSIGNABLE_NAMES = [:first_name, :middle_name, :last_name]
  attr_accessible *ASSIGNABLE_NAMES
  validates_format_of *(ASSIGNABLE_NAMES + [{:with => %r{\A[^\r\n]*\z}m, :allow_blank => true, :allow_nil => true}])
  ASSIGNABLE_NAMES.each do |e|
    define_method "#{e}=" do |value|
      write_attribute(e, value.blank? ? nil : value.strip.gsub(/ +/, ' '))
    end
  end
 
   def full_name
    fnt = self.title.blank? ? '' : "#{self.title.capitalize} "
    fnf = self.first_name.blank? ? '' : "#{self.first_name.capitalize} "
    fnm = self.middle_name.blank? ? '' : " #{self.middle_name.capitalize.scan(/./).first}. "
    fnl = self.last_name.blank? ? '' : "#{self.last_name.capitalize}"
    fnt << fnf <<  fnm << fnl
    return fnt.length > 0 ? fnt.html_safe :  I18n.t(:no_name)
  end
 
    def full_address
    faa = self.address.blank? ? '' : "#{self.address}<br />"
    far = self.state_area_region.blank? ? '' : "#{self.state_area_region}<br />"
    faz = self.zip_code.blank? ? '' : "#{self.zip_code}   "
    fact = self.city.blank? ? '' : " #{self.city}<br />"
    facn = self.country.blank? ? '' : "#{self.country.upcase}"
    faa << far << faz << fact << facn
    return faa.length > 0 ? faa.html_safe : I18n.t(:no_address)
  end 



end
