Feature: Exercise Plan
  In order to allow users and their trainers to view and update an Exercise Plan
  A user
  Should be able to Create, Remove, Update and Display Exercise plans

  Background:
    Given there is an authenticated user named "Alex"
    And I have the following plan_types:
      | name | image_path | position | status |
      | Exercise | dashboard/exercise.png | 1 | 1 |
      | Nutrition | dashboard/nutrition.png | 1 | 1 |
      | Supplement | dashboard/supplement.png | 1 | 0 |
      | Health | dashboard/health.png | 1 | 0 |

  @javascript
  Scenario: No plans yet
    Given "Alex" has not created any plan
    Then I should see "No Plans"

  @javascript
  Scenario: Create an Exercise Plan
    Given "Alex" creates an "Exercise" plan called "My Exercise plan"
    Then I should see "My Exercise..."

 @javascript
  Scenario: Remove an Exercise Plan
    Given I have the following plans:
      | name | description | plan_type | creator |
      | My Exercise plan | Lorem ipsum... | Exercise | Alex |
      | My Nutrition plan | Lorem ipsum... | Nutrition | Alex |
	When I am on the dashboard page
	And I remove the "Exercise" plan named "My Exercise plan"
    Then I should not see "My Exercise"

  @javascript @wip
  Scenario: Add exercises to a plan
    Given I have the following plans:
      | name | description | plan_type | creator |
      | My Exercise plan | Lorem ipsum... | Exercise | Alex |
      | My Nutrition plan | Lorem ipsum... | Nutrition | Alex |
    And I am on the "My Exercise plan" plan page
    Then I should see "My Exercise plan"
    And I should see "No days have been added to this plan yet!"
	When I follow "Add a day"
	And I should wait until I see "Day 1"
	Then show me the page





