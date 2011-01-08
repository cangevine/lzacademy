module RegistrationsHelper
  
  def build_course_header_and_rows(title, courses)
    sessions = []
    programs = []
    
    courses.each do |c|
      sessions.push(c.session) unless sessions.include?(c.session)
      programs.push(c.program) unless programs.include?(c.program)
    end
    
    content = build_course_headers(title, sessions)
    content << build_course_rows(courses, programs, sessions)
  end
  
  def build_course_rows(courses, programs, sessions)  
   content = ""
   programs.map do |program|
     content << content_tag(:tr) do
       concat (content_tag :td, program.name)
       sessions.map do |session|
         concat (content_tag :td, build_session_cell(courses, session, program))
       end
     end
   end
   content.html_safe
  end
  
  def build_session_cell(courses, session, program)
    courses.each do |c|
      if c.is_match?(program.id, session.id)
        content = content_tag(:label) do
          concat(content_tag :input, nil, :type => "checkbox", :id => "registration_course_id_"+String(c.id), 
                              :name => "registration[course_id][]", :value => String(c.id))
          concat(" Register")
          concat(content_tag :span, c.location.name+"  "+"$"+String(c.cost), :class => "course_details")
        end
        return content
      end
    end
    content_tag :span, "N/A", :class => "course_unavailable"
  end
  
  def build_course_headers(title, sessions)
    content = ""
    content << content_tag(:tr) do
      concat(content_tag :th, title.html_safe)
      sessions.map do |session|
        concat(content_tag(:th) do
          concat(session.name)
          concat(content_tag(:span, session.date_range))
        end) 
      end
    end
    content.html_safe
  end  
end
