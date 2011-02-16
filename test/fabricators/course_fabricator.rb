Fabricator(:course) do
  program! { Fabricate(:program) }
  teacher! { Fabricate(:teacher) }
  location! { Fabricate(:location) }
  session_term! { Fabricate(:session_term) }
  days_of_week "Monday - Friday"
  start_time "8:30"
  end_time "2:30"
  min_age 7
  max_age 16
  cost 50
end