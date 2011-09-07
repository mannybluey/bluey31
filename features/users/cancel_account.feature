Feature: Cancel account
  In order to allow users to leave the site
  A user
  Should be able to cancel their account

	@javascript
    Scenario: User signs in and cancels their account
      Given I sign up and sign in with email "user@test.com"
      And I go to the edit profile page
      When I follow "Delete Registration"
      Then I should see "Are you sure you want to delete your profile?"
      When I press "I Confirm !"
      Then I should be on the home page
	  When I sign in as "user@test.com/please"
      Then I should see "Invalid email or password"

