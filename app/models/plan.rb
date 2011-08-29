class Plan < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'
  
  belongs_to :plan_type
  
  validates :name, :presence => true, :uniqueness => true
  validates :description, :presence => true
  validates_associated :plan_type
  
  attr_accessible :name, :description, :plan_items_attributes, :plan_type_id
  
  has_many :days
  has_many :plan_items, :through => :days
  
  has_many :plan_item_versions, :class_name => "Version",
    :finder_sql => proc { "SELECT versions.* 
                           FROM versions
                           WHERE versions.item_type='PlanItem'
                           AND versions.item_id IN (#{plan_items.map(&:id).join(", ")})
                           ORDER BY created_at DESC" }
  has_paper_trail
  has_friendly_id :name, :use_slug => true
  
  cattr_reader :per_page
  @@per_page = 12
  
  class << self
    def all_plans_for(user)
       where(:creator_id => user[:id])
    end
    def exercises(user)
       where(:plan_type_id => 1, :creator_id => user[:id])
    end
    def nutritions(user)
       where(:plan_type_id => 2, :creator_id => user[:id])
    end
    def supplements(user)
       where(:plan_type_id => 3, :creator_id => user[:id])
    end
    def healths(user)
       where(:plan_type_id => 4, :creator_id => user[:id])
    end    
  end
  
end
