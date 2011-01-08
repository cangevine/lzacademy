module ApplicationHelper
  
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end
  
  def stylesheet(*files)
    content_for(:head) { stylesheet_link_tag(*files) }
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
  
end
