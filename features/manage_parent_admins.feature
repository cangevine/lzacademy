Feature: Parents manage student info
	In order manage student info and registrations
	As a parent
	I want to manage my data
  	
	Scenario: Register new camper and new parent
		Given I am on the new parent page
		
		And I fill in "First name" with "Joe" within the student info section
		And I fill in "Last name" with "Student" within the student info section
		And I select "1999" from "Year" within the student info section
		And I select "March" from "Month" within the student info section
		And I select "13" from "Day" within the student info section
		And I fill in "First name" with "Suzy" within the parent info section
		And I fill in "Last name" with "Parent" within the parent info section
		And I fill in "Address" with "123 Street Rd" within the parent info section
		And I fill in "City" with "Cityville" within the parent info section
		And I fill in "Zip" with "12345" within the parent info section
		And I fill in "Email" with "suzy@example.com" within the parent info section
		And I fill in "Home phone" with "555-555-5555" within the parent info section
		And I fill in "Cell phone" with "123-555-6789" within the parent info section
		And I press "Continue" within the body
		
		Then I should see "Information saved successfully" within the success flash
		And I should see "Suzy" within the body
		And show me the page
		And I should see "Joe" within the body

	@javascript
	Scenario: Register two new campers and one new parent
		Given I am on the new parent page

		And I fill in "First name" with "Joe" within the student info section
		And I fill in "Last name" with "Student" within the student info section
		And I select "1999" from "Year" within the student info section
		And I select "March" from "Month" within the student info section
		And I select "13" from "Day" within the student info section
		
		And I click "Add a student" within the student info section
		And I fill in "First name" with "Bobby" within the student info section
		
		And I fill in "First name" with "Suzy" within the parent info section
		And I fill in "Last name" with "Parent" within the parent info section
		And I fill in "Address" with "123 Street Rd" within the parent info section
		And I fill in "City" with "Cityville" within the parent info section
		And I fill in "Zip" with "12345" within the parent info section
		And I fill in "Email" with "suzy@example.com" within the parent info section
		And I fill in "Home phone" with "555-555-5555" within the parent info section
		And I fill in "Cell phone" with "123-555-6789" within the parent info section
		And I press "Continue" within the body

		Then I should see "Information saved successfully" within the success flash
		And I should see "Suzy" within the body
		And I should see "Joe" within the body
	
	Scenario: Edit parent information
		Given I am on the 1st parent page
		When I follow "edit" within ".parent_info"
		Then I should be on the edit 1st parent page
	
	@wip
	Scenario: Edit student information
		Given I am on the 1st parent page
		When I follow "edit" within ".students_info"
		Then I should be on the edit 1st student page