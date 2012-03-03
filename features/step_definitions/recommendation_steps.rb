Given /^a parent creates a new recommendation request$/ do
  Given %Q|I am logged in as that parent|
	When %Q|I follow "new_recommendation"|
	And %Q|I fill in "Teacher name" with "Joe Teacher"|
	And %Q|I fill in "Teacher email" with "teacher@example.com"|
	And %Q|I press "Send recommendation request"|
end