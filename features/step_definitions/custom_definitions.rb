When /^(?:|I )click "([^"]*)"(?: within "([^"]*)")?$/ do |link, selector|
  find(link).click
end
