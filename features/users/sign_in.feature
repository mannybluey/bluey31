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
      Then I should see "Can you live past 100 years old?"

    Scenario: User is not signed up
      Given I am not logged in
      And no user exists with an email of "user@test.com"
      When I go to the sign in page
      And I sign in as "user@test.com/please"
      Then I should see "Invalid email or password."
      And I go to the home page
      And I should be signed out

    Scenario: User enters wrong password
      Given I am not logged in
      And I am a user named "foo" with an email "user@test.com" and password "please"
      When I go to the sign in page
      And I sign in as "user@test.com/wrongpassword"
      Then I should see "Invalid email or password."
      And I go to the home page
      And I should be signed out

    Scenario: User signs in successfully with email first time
      Given I sign up and sign in with name "foo" and email "test@foo.com"
      When I return next time
      Then I should be already signed in

    Scenario: User signs in successfully with email second time
      Given I sign up and sign in with name "foo" and email "test@foo.com"
      And I sign out
      When I sign in as "test@foo.com/please"
      Then I should be on the dashboard page
