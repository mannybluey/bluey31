Capybara.add_selector(:plan_day) do
  xpath { |day| ".//div[@class='day'][#{day}]" }
end

Capybara.add_selector(:plan_metric) do
  xpath { |metric| ".//form[@id='new_plan_item']/div[@class='fields'][#{metric}]" }
end


When /^I wait until "([^"]*)" is visible$/ do |selector|
  page.has_css?("#{selector}", :visible => true)
end

When /^I add the following exercises to a plan:$/ do |table|
  table.hashes.each do |hash|
    When %{I follow "Add a day"}
    Then %{I should wait until I see "Day #{hash[:day]}"}
  end
end

Then /^I should see the following exercises in the plan:$/ do |table|
  table.hashes.each do |hash|
    within(:plan_day, hash[:day]) do
      Then %{I should see "Day #{hash[:day]}"}
      if hash[:exercises].split('(').length == 1
        hash[:exercises].split(',').each do |exercise|
          Then %{I should see "#{exercise.strip}"}
        end
      else
        exercise, sets = hash[:exercises].split('(')
        Then %{I should see "#{exercise.strip}"}
        sets.split(',').each do |set|
          set.gsub!(")", "")
          Then %{I should see "#{set.strip}"}
        end
      end
    end
  end
end