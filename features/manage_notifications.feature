Feature: Manage family notifications
  In order to keep everyone in the family updated regarding their student's progress
  As a parent
  I want to manage notification addresses

	Background:
		Given 1 registered student
		And I am logged in as that parent
			
  Scenario: Add notification address
    Given I follow "notify another email address"
    When I create a new notification address
		Then I should see "Steve Johnson"
		And show me the page
	
	@javascript
	Scenario: Delete a notification address
	  Given I follow "notify another email address"
			And I create a new notification address
 		When I follow "edit" within the notification section
	   	And I follow "delete"
	  Then I should see "Deleted"