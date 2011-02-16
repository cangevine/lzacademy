module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the (\d+)(?:st|nd|rd|th) parent page/
      parent_path(Parent.find($1))
    when /the edit (\d+)(?:st|nd|rd|th) parent page/
      edit_parent_path(Parent.find($1))
    when /the edit (\d+)(?:st|nd|rd|th) student page/
      edit_student_path(Student.find($1))
    when /the (\d+)(?:st|nd|rd|th) teacher page/
      teacher_path(Teacher.find($1))
    when /that student's teacher's page/
      teacher_path(@registered_student.courses.first.teacher)
    when /the teacher sign in page/
      new_teacher_session_path
    when /the parent sign in page/
      new_parent_session_path
    when /that parent's edit page/
      edit_parent_path(@parent)
      
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
