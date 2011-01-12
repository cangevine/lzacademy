module RegistrationsHelper
  
  def build_course_header_and_rows(title, courses)
    terms = []
    programs = []
    
    courses.each do |c|
      terms.push(c.term) unless terms.include?(c.term)
      programs.push(c.program) unless programs.include?(c.program)
    end
    
    content = build_course_headers(title, terms)
    content << build_course_rows(courses, programs, terms)
  end
  
  def build_course_rows(courses, programs, terms)  
   content = ""
   programs.map do |program|
     content << content_tag(:tr) do
       concat (content_tag :td, program.name)
       terms.map do |term|
         concat (content_tag :td, build_term_cell(courses, term, program))
       end
     end
   end
   content.html_safe
  end
  
  def build_term_cell(courses, term, program)
    courses.each do |c|
      if c.is_match?(program.id, term.id)
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
  
  def build_course_headers(title, terms)
    content = ""
    content << content_tag(:tr) do
      concat(content_tag :th, title.html_safe)
      terms.map do |term|
        concat(content_tag(:th) do
          concat(term.name)
          concat(content_tag(:span, term.date_range))
        end) 
      end
    end
    content.html_safe
  end  
end
