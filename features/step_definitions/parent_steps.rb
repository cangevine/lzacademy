When /^I fill in parent info for "([^"]*)"$/ do |name|
  with_scope(selector_for("the parent info section")) do
    When %Q|I fill in "First name" with "#{name}"|
    When %Q|I fill in "Last name" with "Parent"|
    When %Q|I fill in "Address" with "123 Street Rd"|
    When %Q|I fill in "City" with "Cityville"|
    When %Q|I fill in "Zip" with "12345"|
    When %Q|I fill in "Email" with "suzy@example.com"|
    When %Q|I fill in "Home phone" with "555-555-5555"|
    When %Q|I fill in "Cell phone" with "123-555-6789"|
    When %Q|I fill in "Create a password" with "password"|
  end
end