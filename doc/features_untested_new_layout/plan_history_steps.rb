Given /^"([^"]+)" creates and visits a plan called "([^"]+)"$/ do |email, plan_name|
  plan_type = Factory(:plan_type, :name => "Exercise")
  plan = Factory(:plan, :plan_type => plan_type, :name => plan_name, :creator => User.where(:email => email).first)
  visit plan_path(plan)
end

When /^I complete "([^"]+)" on day (\d+)/ do |item, day|
  within(:plan_day, day) do
    check(item)
  end
end