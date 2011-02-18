module CoursesHelper
  def course_enrollment_status(course)
    case course.registrations.length
    when 0
      "empty"
    when 1..3
      "active"
    when 4..10
      "confirmed"
    else
      "full"
    end
  end
end
