Given /^I am authenticated on the symptoms tab$/ do
  Given %{I sign up and sign in with email "user@test.com"}
  And %{I go to the edit profile page}
  And %{I follow "symptoms"}
end