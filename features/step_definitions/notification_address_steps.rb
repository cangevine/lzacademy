Given /^that student has a registration with a notification address$/ do
  @na = Fabricate(:notification_address, :registration => @registered_student.registrations.first)
end