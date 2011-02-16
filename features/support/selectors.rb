module HtmlSelectorsHelper
  def selector_for(scope)
    case scope
    when /the body/
      "html > body"
    when /the (course|student|parent) info section/
      "##{$1}_info"
    when /the (success|notice|error|) flash/
      ".flash_#{$1}"
    when /the notification section/
      ".notification_addresses"
    else
      raise "Can't find mapping from \"#{scope}\" to a selector.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(HtmlSelectorsHelper)