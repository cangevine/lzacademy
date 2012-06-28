module TeachersHelper
  def course_is_archived(c)
    if c.session_term.end_date < Time.now - 6.months
      "archived"
    end
  end
end
