Given /^there is an authenticated user named "([^"]*)"$/ do |name|
	user = Factory(:user)
	user_profile = Factory(:user_profile, :user_id => user[:id], :name => name)
	When %{I sign in as "test@test.com/password"}
	Then %{I should be signed in}
end

Given /^I have the following plan_types:$/ do |table|
  table.hashes.each do |hash|
    plan_type_name = hash[:name] unless hash[:name].empty?
    plan_type = PlanType.where(:name => plan_type_name).first || Factory(:plan_type, :name => hash[:name], :image_path => hash[:image_path], :position => hash[:position].to_i, :status => hash[:status] )
  end
end

Given /^I have the following plans:$/ do |table|
  table.hashes.each do |hash|
    plan_name = hash[:name] unless hash[:name].empty?
    plan_type = PlanType.where(:name => hash[:plan_type]).first 
    creator = UserProfile.where(:name =>  hash[:creator]).first.user
    plan = Plan.where(:name => plan_name).first || Factory(:plan, :name => hash[:name], :description => hash[:description], :plan_type => plan_type, :creator => creator)
  end
end

Given /^"([^"]*)" has not created any plan$/ do |name|
  user =  UserProfile.where(:name => name).first.user
  user.plans.count.should == 0
end

Given /^"([^"]*)" creates (?:a|an) "([^"]*)" plan called "([^"]*)"$/ do |name, plan_type_name, plan_name|
  user =  UserProfile.where(:name => name).first.user
  plan_type = PlanType.where(:name => plan_type_name).first
# create a valid plan 
   When %{I follow "Plans" within the plan navigation menu}
   And %{I follow "+ Add Plan" within the plan filter bar}
   And %{I select "#{plan_type_name.capitalize}" from "plan[plan_type_id]" within the new plan form}
   And %{I fill in "Name" with "#{plan_name}"}
   And %{I fill in "Description" with "Lorem ipsum..."}
   And %{I press "Create"}#
end

When /^I remove the "([^"]*)" plan named "([^"]*)"$/ do |plan_type_name, plan_name|
  plan = Plan.where(:name => plan_name).first
  Then %{I follow "plan-#{plan[:id]}-delete"}
end

When /^I complete "([^"]+)" on day (\d+)/ do |item, day|
  within(:plan_day, day) do
    check(item)
  end
end
