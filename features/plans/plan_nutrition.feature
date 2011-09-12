Feature: Nutrition Plan
  In order to allow users and their trainers to view and update an Nutrition Plan
  A user
  Should be able to Create, Remove, Update and Display Nutrition plans

  Background:
    Given there is an authenticated user named "Alex"
    And I have the following plan_types:
      | name | image_path | position | status |
      | Exercise | dashboard/exercise.png | 1 | 1 |
      | Nutrition | dashboard/nutrition.png | 2 | 1 |
      | Supplement | dashboard/supplement.png | 3 | 0 |
      | Health | dashboard/health.png | 4 | 0 |

  @javascript
  Scenario: Create a Nutrition Plan
    Given "Alex" creates a "Nutrition" plan called "My Nutrition plan"
    Then I should see "My Nutritio..."

 @javascript
  Scenario: Remove a Nutrition Plan
    Given "Alex" creates an "Nutrition" plan called "My Nutrition plan"
	When I remove the "Nutrition" plan named "My Nutrition plan"
    Then I should see "No Plans"