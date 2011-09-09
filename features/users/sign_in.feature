Feature: Sign in
  In order to get access to protected sections of the site
  A user
  Should be able to sign in

    Scenario: Guest tries to access plans page
      Given I try to access the plans page when unauthorised
      Then I should be told to sign in

    Scenario: Guest tries to create a plan
      Given I try to access the new plan page when unauthorised
      Then I should be told to sign in

    Scenario: Guest tries to access user pictures page
      Given I try to access the user pictures page when unauthorised
      Then I should be told to sign in

    Scenario: Guest tries to access user goals page
      Given I try to access the user goals page when unauthorised
      Then I should be told to sign in

    Scenario: Guest tries to access edit profile page
      Given I try to access the edit profile page when unauthorised
      Then I should be told to sign in

    Scenario: Guest tries to access dashboard page
      Given I try to access the edit profile page when unauthorised
      Then I should be told to sign in

    Scenario: Guest visits the home page
      Given I am not logged in
      When I go to the home page
      Then I should see "Sign up"

	@javascript 
    Scenario: User is not signed up
      Given I am not logged in
      And no user exists with an email of "user@test.com"
      And I sign in as "user@test.com/please"
      Then I should see "Invalid email or password"
	
	@javascript
    Scenario: User enters wrong password
      Given I am not logged in
      And I am a user with an email "user@test.com" and password "please"
      And I sign in as "user@test.com/wrongpassword"
      Then I should see "Invalid email or password"


	@javascript
    Scenario: User signs in successfully with email second time
      Given I sign up and sign in with email "test@foo.com"
      And I sign out
      When I sign in as "test@foo.com/please"
	  Then I should be signed in
      And I should be on the dashboard page
