require 'spec_helper'

describe PlanItemsController do
  login_user

  describe "Complete a plan item" do
    it "should save an item as completed" do
      plan_item = Factory.create(:plan_item)
      put :update, :id => plan_item.id, :plan_item => {:completed => true}
      assigns[:plan_item].completed.should be_true
    end

    it "should not complete an non-existant item" do
      lambda {put :update, :id => -1}.should raise_error(ActiveRecord::RecordNotFound)
    end

    it "should save an item as not completed" do
      plan_item = Factory.create(:plan_item, :completed => true)
      put :update, :id => plan_item.id, :plan_item => {:completed => false}
      assigns[:plan_item].completed.should be_false
    end

    it "should have some metrics" do
      plan_item = Factory.create(:plan_item)
      Factory.create(:metric, :amount => "3", :unit => "Lengths", :plan_item => plan_item)
      Factory.create(:metric, :amount => "4", :unit => "kg", :plan_item => plan_item)
      plan_item.metrics.count.should == 2
    end
  end
end
