Feature: Teachers login to manage info
	In order to give teachers up-to-date information
	As a teacher
	I want to view and manage student information
  
	Scenario Outline: Login as a teacher
		Given the following teacher:
		  | first_name | Colin            |
		  | last_name  | Angevine         |
		  | email      | test@example.com |
		  | password   | password         |
		And I am on the teacher sign in page
	  When I fill in "Email" with <email>
	  And I fill in "Password" with <password>
		And I press "Sign in"
	  Then I should see <feedback>
	  
	  Examples:
	     | email              | password   | feedback    |
	     | "test@example.com" | "password" | "Signed in" |
	     | "test@example.com" | "bleh"     | "Invalid"   |
	     | "fail"             | "password" | "Invalid"   |
