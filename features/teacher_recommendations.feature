Feature: Parents submit a request for a teacher to submit a recommendation
	In order to help the camp know where to place a student
	As a parent or teacher
	I want to request and submit a recommendation form
	
	Background:
		Given 1 registered student
	
	Scenario: Create a new recommendation request
		Given I am logged in as that parent
		When I follow "new_recommendation"
		And I fill in "Teacher name" with "Joe Teacher"
		And I fill in "Teacher email" with "joe@example.com"
		And I press "Send recommendation request"
		Then I should see "The teacher has been notified about your request."
	
	Scenario: Receive a recommendation request
		Given a parent creates a new recommendation request
		And "teacher@example.com" should receive an email with subject "An academic request on behalf of"
		When I open the email
		And I click the first link in the email
		Then I should see "Thank you, Joe Teacher"
		
	@wip
	Scenario: Fill out a recommendation
		Given a parent creates a new recommendation request
		And "teacher@example.com" should receive an email with subject "An academic request on behalf of"
		When I open the email
		And I click the first link in the email
		And I fill in "Your school" with "Sample School"
		And I press "Submit your recommendation"
		Then I should see "Your recommendation form has been saved successfully"
		And "teacher@example.com" should receive an email with subject "Thank you for your recommendation"
		And I open the email with subject "Thank you for your recommendation"
		And I should see "LinguaZone.com" in the email body