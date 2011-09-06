Feature: Edit profile
	In order to allow users to customise their profiles
	A user
	Should be able to edit their profile

	@javascript
	Scenario: User fills in foundation information
		  Given I have the following user_type records:
		    | name                 |
		    | A trainer            |
		    | Looking for trainers |
		  And I have the following user_want records:
		    | name                 |
		    | Lose weight          |
		    | Train for sport      |
		  And I sign up and sign in with email "user@test.com"
		  And I go to the edit profile page
		  When I check "A trainer"
		  And I check "Lose weight"
		  And I select "United Kingdom" from "user_profile[country]"
		  And I fill in "user_profile_city" with "Bristol"
		  And I fill in "user_profile_name" with "foo"
		
		
		  And I select "31" from "user_profile[dob(3i)]"
		  And I select "12" from "user_profile[dob(2i)]"
		  And I select "1975" from "user_profile[dob(1i)]"
		
		  And I press "Save"		
		  Then I should see "User profile was successfully updated"
		  And the "user_profile_name" field should contain "foo"
		  And the "user_profile_city" field should contain "Bristol"
		  And the "user_profile[country]" field should contain "GB"
		  And the "Lose weight" checkbox should be checked
		  And the "A trainer" checkbox should be checked
		
		  And the "user_profile[dob(3i)]" field should contain "31"
		  And the "user_profile[dob(2i)]" field should contain "12"
		  And the "user_profile[dob(1i)]" field should contain "1975"
