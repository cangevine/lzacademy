When /^I fill in student info for "([^"]*)"$/ do |name|
  within(:xpath, "//fieldset[@id='student_info']/ol/ul[last()]") do
    When %Q|I fill in "First name" with "#{name}"|
    When %Q|I fill in "Last name" with "Student"|
    When %Q|I select "1999" from "Year"|
    When %Q|I select "March" from "Month"|
    When %Q|I select "13" from "Day"|
  end
end