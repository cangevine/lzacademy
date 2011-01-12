Feature: Teachers manage student comments
	In order to keep parents up to speed
	As a teacher
	I want to write and manage student comments
  	
	Scenario: Create new student comment
		Given I am on the 1st teacher page
		When I follow "Write a new comment" within the body
		And I fill in "comment_body" with "Great work in class today!"
		And I press "Create Comment"
		Then I should see "New comment saved" within the body
	
	Scenario: View all student comments
		Given I am on the 1st teacher page
		When I follow "1 comment" within the body
		Then I should see "Teacher comments" within the body
	