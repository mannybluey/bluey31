Feature: Manage exercise plans
  In order to allow users to manage their exercise regime
  A user
  Should be able to manage their exercise plans

    Background:
      Given I have the following users:
        | name         | email         | password   |
        | Alex         | alex@test.com | mypassword |
        | Manny        | manny@bluey.com | otherpassword |
        | Dave         | dave@dave.com | mypassword |

    Scenario: View list of existing plans
      Given I sign in as "alex@test.com/mypassword"
      And I have the following plans created by Alex:
        | name         | day | exercises            |
        | Alex's plan  | 1   | Bench press, Sit-ups |
        |              | 2   | Sit-ups              |
      And I have the following plans created by Manny:
        | name         | day | exercises            |
        | Manny's plan  | 1   | Bench press, Sit-ups |
        |              | 2   | Sit-ups              |
      When I follow "Plans" within "nav"
      Then I should see the following list of plans:
        | creator | name        |
        | Alex    | Alex's plan |
      And I should not see the following list of plans:
        | creator | name        |
        | Manny   | Manny's plan |

    @javascript
    Scenario: View an existing plan and complete some exercises
      Given I sign in as "dave@dave.com/mypassword"
      And I have the following plans created by Dave:
        | name    | day | exercises              |
        | My plan | 1   | Bench press, Sit-ups   |
        | My plan | 2   | Sit-ups                |
      And I follow "Plans" within "nav"
      And I follow "My plan"
      Then I should see "Bench press"
      When I check "Bench press" inside day 1
      And I check "Sit-ups" inside day 2
      Then "Bench press" inside day 1 should be completed
      Then "Sit-ups" inside day 2 should be completed
      When I uncheck "Sit-ups" inside day 2
      Then "Sit-ups" inside day 2 should not be completed
      And I reload the page
      Then "Bench press" inside day 1 should be completed
      Then "Sit-ups" inside day 2 should not be completed

    Scenario: Creating a plan without a name
      Given I sign in as "dave@dave.com/mypassword"
      And I follow "Plans" within "nav"
      And I follow "Create a plan"
      And I fill in "Description" with "My description"
      And I press "Create"
      Then I should see "Name can't be blank"

    Scenario: Create a valid plan
      Given I sign in as "dave@dave.com/mypassword"
      And I follow "Plans" within "nav"
      And I follow "Create a plan"
      And I fill in "Name" with "My plan name"
      And I fill in "Description" with "My description"
      And I press "Create"
      Then I should be on the "My plan name" plan page
      And I should see "My plan name"

    @javascript
    Scenario: Add a day to a plan
      Given I sign in as "dave@dave.com/mypassword"
      And I have the following plans created by Dave:
        | name | day | exercises |
        | My empty plan | | |
      And I am on the "My empty plan" plan page
      Then I should see "My empty plan"
      And I should see "No days have been added to this plan yet!"
      When I add the following days:
        | day  | exercises                                             |
        | 1    | Bench press (Set 1: 10 kg 10 minutes, Set 2: 15 kg)   |
        | 1    | Sit-ups (Set 1: 10 minutes)                           |
        | 2    | Bench press (Set 1: 10 kg 10 minutes)                 |
      Then I should see the following plan:
        | day  | exercises                                             |
        | 1    | Bench press (Set 1: 10 kg 10 minutes, Set 2: 15 kg)   |
        | 1    | Sit-ups (Set 1: 10 minutes)                           |
        | 2    | Bench press (Set 1: 10 kg 10 minutes)                 |

    Scenario: Delete a day from a plan which has one day
      Given I sign in as "dave@dave.com/mypassword"
      And I have the following plans created by Dave:
        | name          | day | exercises   |
        | My plan       | 1   | Bench press |
      And I am on the "My plan" plan page
      Then I should see "My plan"
      And I should see "Day 1"
      When I follow "Delete day" within ".day"
      Then I should not see "Day 1"
      And I should see "No days have been added to this plan yet!"

    Scenario: Delete a day from the middle of a plan with multiple days
      Given I sign in as "dave@dave.com/mypassword"
      And I have the following plans created by Dave:
        | name          | day | exercises            |
        | My plan       | 1   | Bench press          |
        |               | 2   | Bench press, Sit-ups |
        |               | 3   | Bench press          |
        |               | 4   | Sit-ups              |
      And I am on the "My plan" plan page
      Then I should see "My plan"
      When I follow "Delete day" inside day 2
      Then I should see the following plan:
        | day | exercises            |
        | 1   | Bench press          |
        | 2   | Bench press          |
        | 3   | Sit-ups              |
      And I should see "undo"
      When I follow "undo"
      Then I should see the following plan:
        | day | exercises            |
        | 1   | Bench press          |
        | 2   | Bench press, Sit-ups |
        | 3   | Bench press          |
        | 4   | Sit-ups              |
      And I should see "redo"
      When I follow "redo"
      Then I should see the following plan:
        | day | exercises            |
        | 1   | Bench press          |
        | 2   | Bench press          |
        | 3   | Sit-ups              |

    @javascript
    Scenario: Try to input an exercise without a name
      Given I sign in as "dave@dave.com/mypassword"
      And I have the following plans created by Dave:
        | name          | day | exercises              |
        | Simple plan   | 1   |                        |
      And I am on the "Simple plan" plan page
      When I try to add an empty exercise
      Then I should see "Please fix the following 1 error"
      And I should see "Exercise can't be blank"
      When I fill in "Exercise" with "My exercise"
      And I press "Add exercise"
      Then I should not see "Exercise can't be blank"

    @javascript
    Scenario: Delete an exercise
      Given I sign in as "dave@dave.com/mypassword"
      And I have the following plans created by Dave:
        | name        | day | exercises   |
        | Simple plan | 1   | Bench press |
        |             | 1   | Bicep curls |
      And I am on the "Simple plan" plan page
      When I delete the exercise 2 on day 1
      Then I should see the following plan:
        | name        | day | exercises   |
        | Simple plan | 1   | Bench press |
      And I should see "undo"
      When I follow "undo"
      Then I should see the following plan:
        | name        | day | exercises   |
        | Simple plan | 1   | Bench press |
        |             | 1   | Bicep curls |
      And I should see "redo"
      When I follow "redo"
      Then I should see the following plan:
        | name        | day | exercises   |
        | Simple plan | 1   | Bench press |

    @javascript
    Scenario: Rename a plan
      Given I sign in as "dave@dave.com/mypassword"
      And I have the following plans created by Dave:
        | name        | day | exercises   |
        | Simple plan | 1   | Bench press |
      And I am on the "Simple plan" plan page
      When I click on "#plan h1 .on_the_spot_editing"
      And I fill in "value" with "My new plan name"
      And I press "Save" within "#plan h1"
      Then I should see "My new plan name"
      When I reload the page
      Then I should see "My new plan name"

    @javascript
    Scenario: Change plan description
      Given I sign in as "dave@dave.com/mypassword"
      And I have the following plans created by Dave:
        | name        | day | exercises   |
        | Simple plan | 1   | Bench press |
      And I am on the "Simple plan" plan page
      When I click on "#plan #description .on_the_spot_editing"
      And I fill in "value" with "New plan description"
      And I press "Save" within "#plan #description"
      Then I should see "New plan description"
      When I reload the page
      Then I should see "New plan description"

    Scenario: Deleting a plan
      Given I sign in as "dave@dave.com/mypassword"
      And I have the following plans created by Dave:
        | name        | day | exercises   |
        | Simple plan | 1   | Bench press |
      And I am on the plans page
      When I follow "delete"
      Then I should see "Deleted plan"
      And I should not see "Simple plan"
      When I follow "undo"
      Then I should see "Simple plan"
      When I follow "redo"
      Then I should not see "Simple plan"

    Scenario: I should only be able to view my own plans
      Given I sign in as "alex@test.com/mypassword"
      And I have the following plans created by Dave:
        | name        | day | exercises   |
        | Simple plan | 1   | Bench press |
      When I go to the "Simple plan" plan page
      Then I should see "Unauthorised"

    @javascript
    Scenario: Editing a plan item
      Given I sign in as "dave@dave.com/mypassword"
      And I have the following plans created by Dave:
        | name        | day | exercises |
        | Dave's plan |     |           |
      And I am on the "Dave's plan" plan page
      When I add the following days:
        | day  | exercises                    |
        | 1    | Bench press                  |
        | 1    | Sit-ups                      |
        | 2    | Bench press                  |
      And I open the edit form for exercise 2 on day 1
      And I fill in "Exercise" with "My other exercise"
      And I press "Update"
      Then show me the page
      Then I should see the following plan:
        | day  | exercises                    |
        | 1    | Bench press                  |
        | 1    | My other exercise            |
        | 2    | Bench press                  |
      And I should not see "Update"

    @javascript
    Scenario: Cancel editing a plan item
      Given I sign in as "dave@dave.com/mypassword"
      And I have the following plans created by Dave:
        | name        | day | exercises |
        | Dave's plan |     |           |
      And I am on the "Dave's plan" plan page
      When I add the following days:
        | day  | exercises                                             |
        | 1    | Bench press (Set 1: 10 kg 10 minutes, Set 2: 15 kg)   |
        | 1    | Sit-ups (Set 1: 10 minutes)                           |
        | 2    | Bench press (Set 1: 10 kg 10 minutes)                 |
      And I open the edit form for exercise 2 on day 1
      And I follow "cancel"
      Then the edit form should be closed
