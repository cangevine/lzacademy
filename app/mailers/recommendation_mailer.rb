class RecommendationMailer < ActionMailer::Base
  default :from => "LinguaZone Academy <info@lzacademy.com>"
  default :bcc => ["colinangevine@gmail.com", "magistraroberts@hotmail.com"]
#  default :bcc => ["colinangevine@gmail.com"]
  default_url_options[:host] = "lzacademy.com"
  
  def teacher_request_notice(rec, stu)
    @recommendation = rec
    @student = stu
    mail(:to => @recommendation.teacher_email, :subject => "An academic request on behalf of #{@student.display_name}")
  end
  
  def teacher_thank_you_notice(rec, stu)
    @recommendation = rec
    @student = stu
    mail(:to => @recommendation.teacher_email, :subject => "Thank you for your recommendation")
  end
end
