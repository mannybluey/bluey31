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

 @javascript @wip
  Scenario: Remove an Exercise Plan
    Given I have the following plans:
      | name | description | plan_type | creator |
      | My Exercise plan | Lorem ipsum... | Exercise | Alex |
      | My Nutrition plan | Lorem ipsum... | Nutrition | Alex |
	When I am on the dashboard page
	And I remove the "Exercise" plan named "My Exercise plan"
    Then I should not see "My Exercise"

  Scenario: Add an item to an Exercise plan

  Scenario: Update Exercise plan item

  @javascript
  Scenario: Complete an Exercise plan item
    Given I have the following plans created by Alex:
      | name        | day | exercises   |
      | Simple plan | 1   | Bench press |
    And I am on the "Simple plan" plan page
    When I add the following days:
      | day  | exercises                                             |
      | 1    | Bench press (Set 1: 10 kg 10 minutes, Set 2: 15 kg)   |
      | 1    | Sit-ups (Set 1: 10 minutes)                           |
      | 2    | Bench press (Set 1: 10 kg 10 minutes)                 |
    And I complete "Bench press" on day 1
    Then I should see "Completed Bench press on day 1" within ".history"

  Scenario: Uncomplete an Exercise plan item

  Scenario: Delete an Exercise plan item

  Scenario: Challenge an update

  Scenario: Restore an Exercise plan item
