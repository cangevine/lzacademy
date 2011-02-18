module CoursesHelper
  def course_enrollment_status(course)
    case course.registrations.length
    when 0
      "empty"
    when 1, 2
      "active"
    when 3..10
      "confirmed"
    else
      "full"
    end
  end
end
