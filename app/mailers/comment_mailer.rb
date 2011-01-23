class CommentMailer < ActionMailer::Base
  default :from => "LinguaZone Academy <info@lzacademy.com>"
  default_url_options[:host] = "lzacademy.com"
  
  def created_notice(comment)
    @comment = comment
    @reg = @comment.registration
    mail(:to => "info@lzacademy.com", :subject => "[PENDING] Comment by #{@reg.course.teacher.display_name}")
    mail(:to => "magistraroberts@hotmail.com", :subject => "[PENDING] Comment by #{@reg.course.teacher.display_name}")
  end
  
  def updated_body_notice(comment)
    @comment = comment
    @reg = @comment.registration
    mail(:to => "info@lzacademy.com", :subject => "[UPDATED] Comment by #{@reg.course.teacher.display_name}")
    mail(:to => "magistraroberts@hotmail.com", :subject => "[UPDATED] Comment by #{@reg.course.teacher.display_name}")
  end
  
  def updated_feedback_notice(comment)
    @comment = comment
    @reg = @comment.registration
    mail(:to => "colinangevine@gmail.com", :subject => "New feedback on your comment for #{@reg.student.display_name}")
    mail(:to => @reg.course.teacher.email, :subject => "New feedback on your comment for #{@reg.student.display_name}")
  end
  
  def published_notice(comment)
    @comment = comment
    @reg = @comment.registration
    mail(:to => "colinangevine@gmail.com", :subject => "[LinguaZone] A new comment from #{@reg.course.teacher.display_name}")
    mail(:to => @reg.student.parent.email, :subject => "[LinguaZone] A new comment from #{@reg.course.teacher.display_name}")
  end
end
