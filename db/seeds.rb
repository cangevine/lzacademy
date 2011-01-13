# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Location.create(:name => "Episcopal Academy", :address => "1234 Street Road", :city => "Newtown Square", :zip => "12341", 
                  :url => "http://www.example.com")
Location.create(:name => "Haverford School", :address => "1234 Lancaster Ave", :city => "Haverford", :zip => "14131", 
                  :url => "http://www.example.com")

Program.create(:name => "Beginning Latin", :language => "Latin", :level => "beginner", :description => "Latin 1 class descrip")
Program.create(:name => "Intermediate Latin", :language => "Latin", :level => "intermediate", :description => "Latin 2 class descrip")
Program.create(:name => "Beginning Spanish", :language => "Spanish", :level => "beginner", :description => "Spanish 1 class descrip")
Program.create(:name => "Intermediate Spanish", :language => "Spanish", :level => "intermediate", :description => "Spanish 2 class descrip")
Program.create(:name => "Beginning French", :language => "French", :level => "beginner", :description => "French 1 class descrip")
Program.create(:name => "Spanish Explorers", :language => "Spanish", :level => "explorer", :description => "Spanish Explorers class descrip")

Term.create(:start_date => "2011-06-27 00:00:00", :end_date => "2011-07-15 00:00:00", :name => "Session 1",  :description => "Sess 1 descrip")
Term.create(:start_date => "2011-07-18 00:00:00", :end_date => "2011-08-05 00:00:00", :name => "Session 2",  :description => "Sess 2 descrip")
Term.create(:start_date => "2011-07-05 00:00:00", :end_date => "2011-07-15 00:00:00", :name => "Session 1",  :description => "Sess 1 descrip")
Term.create(:start_date => "2011-07-18 00:00:00", :end_date => "2011-07-29 00:00:00", :name => "Session 2",  :description => "Sess 2 descrip")

Role.create(:name => "admin")
Role.create(:name => "teacher")
Role.create(:name => "parent")

Teacher.create(:first_name => "Colin", :last_name => "Angevine", :nickname => "BC", :cell_phone => "555-555-5555", :bio => "BC's teacher bio", 
                 :shirt_size => "Adult large")
Teacher.create(:first_name => "Katie", :last_name => "Pidot", :cell_phone => "123-555-1111", :bio => "Katie's teacher bio", 
                 :shirt_size => "Adult medium")
Teacher.create(:first_name => "Lauren", :last_name => "Betz", :cell_phone => "333-555-6666", :bio => "Lauren's teacher bio", 
                  :shirt_size => "Adult small")

Course.create(:program_id => 1, :teacher_id => 1, :location_id => 1, :term_id => 1, :days_of_week => "Mon - Fri", 
                 :start_time => "8:30", :end_time => "2:30", :cost => "1500", :min_age => 11, :max_age => 17)
Course.create(:program_id => 2, :teacher_id => 1, :location_id => 1, :term_id => 2, :days_of_week => "Mon - Fri", 
                 :start_time => "8:30", :end_time => "2:30", :cost => "1500", :min_age => 11, :max_age => 17)
Course.create(:program_id => 6, :teacher_id => 2, :location_id => 1, :term_id => 3, :days_of_week => "Mon - Fri", 
                 :start_time => "8:30", :end_time => "2:30", :cost => "1500", :min_age => 4, :max_age => 10)
Course.create(:program_id => 6, :teacher_id => 2, :location_id => 2, :term_id => 4, :days_of_week => "Mon - Fri", 
                 :start_time => "8:30", :end_time => "2:30", :cost => "1500", :min_age => 4, :max_age => 10)
Course.create(:program_id => 5, :teacher_id => 3, :location_id => 1, :term_id => 2, :days_of_week => "Mon - Fri", 
                  :start_time => "8:30", :end_time => "2:30", :cost => "1500", :min_age => 11, :max_age => 17)

Parent.create(:first_name => "Judy", :last_name => "Parent", :address => "123 Street Rd.", :city => "Townville", :zip => "55555", 
                :email => "judy@example.com", :home_phone => "555-555-5555", :cell_phone => "123-456-7890")                  

Student.create(:first_name => "Robert", :last_name => "Student", :nickname => "Bob", :birthday => "10-05-1999 00:00:00", 
                :shirt_size => "Adult small", :parent_id => 1)
                
Registration.create(:student_id => 1, :course_id => 1, :balance => 0)

Comment.create(:registration_id => 1, :body => "This is a test comment")

