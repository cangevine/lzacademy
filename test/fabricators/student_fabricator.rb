Fabricator(:student) do
  first_name "John"
  last_name "Student"
  birthday Time.now
  parent! { Fabricate(:parent) }
end

Fabricator(:registered_student, :from => :student) do
  courses! { [ Fabricate(:course) ] }
end