require 'spec_helper'

describe PlanItem do
  before(:each) do
    @plan_item = PlanItem.new
  end

  it "should require a name" do
    @plan_item.should_not be_valid
    @plan_item.errors.on(:name).should eql("can't be blank")
    @plan_item.name = "Hello world"
    @plan_item.should be_valid
  end
end
# == Schema Information
#
# Table name: plan_items
#
#  id         :integer(4)      not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  day_id     :integer(4)
#  position   :integer(4)
#  completed  :boolean(1)      default(FALSE)
#  name       :string(255)
#

