class Plan < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'
  validates_presence_of :name
  attr_accessible :name, :description, :plan_items_attributes
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
    def exercises(user)
       where(:type_id => 1, :user_id => user[:id])
    end
    def nutritions(user)
       where(:type_id => 2, :user_id => user[:id])
    end
    def supplements(user)
       where(:type_id => 3, :user_id => user[:id])
    end
    def healths(user)
       where(:type_id => 4, :user_id => user[:id])
    end    
  end
  
end
