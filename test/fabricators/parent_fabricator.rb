Fabricator(:parent) do
  email "parent@example.com"
  password "password"
  first_name "Suzy"
  last_name "Parent"
  address "123 Street Rd"
  city "Cityville"
  zip "12345"
  home_phone "(444) 555-5555"
  after_create { |parent| 
    r = Role.where(:name => "parent").first
    RolesUsers.create(:role_id => r.id, :parent_id => parent.id) 
  }
end