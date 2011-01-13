module ApplicationHelper
  
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end
  
  def stylesheet(*files)
    content_for(:head) { stylesheet_link_tag(*files) }
  end
  
  def fancybox
    content_for(:head) { 
      '<script type="text/javascript" src="/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
      <script type="text/javascript" src="/fancybox/jquery.easing-1.3.pack.js"></script>
      <script type="text/javascript" src="/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>'.html_safe
    }
  end
  
  def format_date(val)
    val.strftime '%B %e' unless val.nil?
  end
  def format_date_with_year(val)
    val.strftime '%B %e, %Y' unless val.nil?
  end
  def format_date_time(val)
    val.strftime '%b %e at %l:%M %p' unless val.nil?
  end
  def format_short_date(val)
    val.strftime '%D' unless val.nil?
  end
  
  def format_balance(val)
    if val < 0
      "pending..."
    else
      "$"+String(val)
    end
  end
  
  ## Add and remove nested partial forms dynamically ##
  def new_child_fields_template(form_builder, association, options = {})
    options[:object] ||= form_builder.object.class.reflect_on_association(association).klass.new
    options[:partial] ||= association.to_s + "/form"
    options[:form_builder_local] ||= :f

    content_for :jstemplates do
      content_tag(:div, :id => "#{association}_fields_template", :style => "display: none") do
        form_builder.fields_for(association, options[:object], :child_index => "new_#{association}") do |f|        
          render(:partial => options[:partial], :locals => { options[:form_builder_local] => f })        
        end
      end
    end
  end
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to(name, "javascript:void(0)", :class => "remove_child")
  end
  def link_to_add_fields(name, f, association)
    link_to(name, "javascript:void(0)", :class => "add_child", :"data-association" => association)
  end
  
  ## Display course registration information dynamically ##
  def build_course_header_and_rows(title, courses, registerable)
    terms = []
    languages = []
    
    courses.each do |c|
      terms.push(c.term) unless terms.include?(c.term)
      languages.push(c.program.language) unless languages.include?(c.program.language)
    end
    
    content = build_course_headers(title, terms)
    content << build_course_rows(languages, courses, terms, registerable)
  end
  
  def build_course_rows(languages, courses, terms, registerable)  
   content = ""
   languages.map do |language|
     content << content_tag(:tr) do
       concat (content_tag :td, language)
       terms.map do |term|
         concat (content_tag :td, build_term_cell(courses, term, language, registerable))
       end
     end
   end
   content.html_safe
  end
  
  def build_term_cell(courses, term, language, registerable)
    logger.debug "Writing cell for #{term.id} in #{language}..."
    content = ""
    na = true
    courses.map do |c| 
      logger.debug "\tFound... #{c.id} is that a match?"
      if c.is_match?(language, term.id)
        content << content_tag(:div, :class => "course_info") do
          if registerable
            concat(content_tag :input, nil, :type => "checkbox", :id => "registration_course_id_"+String(c.id), 
                              :name => "registration[course_id][]", :value => String(c.id))
          end
          concat(c.program.name)
          concat(content_tag :span, "at #{c.location.name}  $#{c.cost}", :class => "course_details")
        end
        na = false
      end
    end
    if na
      content_tag :p, "N/A", :class => "course_unavailable"
    else
      content.html_safe
    end
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
