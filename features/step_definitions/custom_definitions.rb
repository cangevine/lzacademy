When /^(?:|I )click "([^"]*)"(?: within "([^"]*)")?$/ do |link, selector|
  find(link).click
end

Given /^I am logged in as that student's teacher$/ do
  Given %Q|I am on the teacher sign in page|
  When %Q|I fill in "Email" with "test@example.com"|
  And %Q|I fill in "Password" with "password"|
	And %Q|I press "Sign in"|
  Then %Q|I should see "John"|
end

Given /^I am logged in as that parent$/ do
  Given %Q|I am on the parent sign in page|
  When %Q|I fill in "Email" with "parent@example.com"|
  And %Q|I fill in "Password" with "password"|
	And %Q|I press "Sign in"|
  Then %Q|I should see "Suzy"|
end

Given /^that student's registration has (\d+) comment$/ do |num|
  num.to_i.times do
    @comment = Fabricate(:comment, :registration => @registered_student.registrations.first)
    @comment.save
  end
end


When /^I write a new comment$/ do
  When %Q|I follow "Write a new comment"|
    And %Q|I fill in "Your comment" with "Great job in class today"|
    And %Q|I press "Create"|
end

When /^I create a new notification address$/ do
  When %Q|I fill in "First name" with "Steve"|
	And %Q|I fill in "Last name" with "Johnson"|
	And %Q|I fill in "Email" with "steve@example.com"|
	And %Q|I press "Create"|
end