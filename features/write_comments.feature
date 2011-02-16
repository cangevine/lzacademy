Feature: Teachers manage student comments
	In order to keep parents up to speed
	As a teacher
	I want to write and manage student comments
  	
  Background:
    Given 1 registered student
  
	Scenario Outline: Create new student comment
		Given I am logged in as that student's teacher
		When I follow "Write a new comment"
		  And I fill in "Your comment" with <comment_body>
		  And I press "Create Comment"
		Then I should see <feedback>
		
		Examples:
		   | comment_body                 | feedback            |
       | "Great work in class today!" | "New comment saved" |
       | ""                           | "Could not save"    |

	Scenario: Create a new student comment
	  Given I am logged in as that student's teacher
	  When I write a new comment
	  Then I should see "1 comment"

	Scenario: View all student comments
		Given I am logged in as that student's teacher
		  And I write a new comment
		When I follow "1 comment"
		Then I should see "Notes from the teacher"
		  And I should see "Great job in class today"
	