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
    Given I have the following plans:
      | name | description | plan_type | creator |
      | My Exercise plan | Lorem ipsum... | Exercise | Alex |
      | My Nutrition plan | Lorem ipsum... | Nutrition | Alex |
	When I am on the dashboard page
	And I remove the "Nutrion" plan named "My Nutrition plan"
    Then I should not see "My Nutritio..."
