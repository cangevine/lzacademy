Feature: Parents manage student info
	In order manage student info and registrations
	As a parent
	I want to manage my data
  
	@javascript
	Scenario: Register new camper and new parent
		Given I am on the new parent page
		When I fill in student info for "Joe"
			And I fill in parent info for "Suzy"
			And I press "Save and continue"
		Then I should see "successfully"
			And I should see "Suzy"
			And I should see "Joe"

	@javascript
	Scenario: Register two new campers and new parent
		Given I am on the new parent page
		When I fill in student info for "Joe"
			And I follow "Add a student"
			And I fill in student info for "Steve"
			And I fill in parent info for "Suzy"
			And I press "Save and continue"
		Then I should see "successfully"
			And I should see "Suzy"
			And I should see "Steve"
			And I should see "Joe"

	Scenario Outline: Login as an existing parent
	  Given 1 parent
	  When I go to the parent sign in page
	  And I fill in "Email" with <email>
	  And I fill in "Password" with <password>
	  And I press "Sign in"
	  Then I should see <feedback>
	  
	  Examples:
	    | email                | password   | feedback                 |
	    | "parent@example.com" | "password" | "Signed in successfully" |
	    | "parent@example.com" | "fail"     | "Invalid"                |
	
	Scenario: Edit parent information
		Given 1 parent
		And I am logged in as that parent
		And I am on that parent's edit page
		When I fill in "First name" with "Julie" 
		And I press "Update"
		Then I should see "Julie"