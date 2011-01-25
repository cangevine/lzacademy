class CommentMailer < ActionMailer::Base
  default :from => "LinguaZone Academy <info@lzacademy.com>"
  default_url_options[:host] = "lzacademy.com"
  
  def created_notice(comment, email)
    @comment = comment
    @reg = @comment.registration
    mail(:to => email, :subject => "[PENDING] Comment by #{@reg.course.teacher.display_name}")
  end
  
  def updated_body_notice(comment, email)
    @comment = comment
    @reg = @comment.registration
    mail(:to => email, :subject => "[UPDATED] Comment by #{@reg.course.teacher.display_name}")
  end
  
  def updated_feedback_notice(comment, email)
    @comment = comment
    @reg = @comment.registration
    mail(:to => email, :subject => "New feedback on your comment for #{@reg.student.display_name}")
  end
  
  def published_notice(comment)
    @comment = comment
    @reg = @comment.registration
    mail(:to => email, :subject => "[LinguaZone] A new comment from #{@reg.course.teacher.display_name}")
  end
end
