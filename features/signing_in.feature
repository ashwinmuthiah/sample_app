Feature: Signing in 

Scenario: Unsuccessful signin
	Given a user visits the signin page
	When he submits invalid signin information
	Then he should see an error message

Scenario: Successful signin
	Given a user visits the signin page
	And the user has an account
	When the user submits valid signin information
	Then he should see his profile page
	And he should see a signout link

Scenario: Update profile
  Given a user has an account
  And he visits the signin page
  And he submits valid signin information
  When a user visits the edit profile page
  Then he should see a settings link