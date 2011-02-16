Fabricator(:teacher) do
  email "test@example.com"
  password "password"
  first_name "Joe"
  last_name "Teacher"
  after_create { |teacher| 
    r = Role.where(:name => "teacher").first
    RolesUsers.create(:role_id => r.id, :teacher_id => teacher.id) 
  }
end