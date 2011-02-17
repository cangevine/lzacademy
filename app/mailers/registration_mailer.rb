class RegistrationMailer < ActionMailer::Base
  default :from => "LinguaZone Academy <info@lzacademy.com>"
  default :cc => ["colinangevine@gmail.com", "magistraroberts@hotmail.com"]
  default_url_options[:host] = "lzacademy.com"
  
  def application_received(regs)
    @regs = regs
    mail(:to => @regs[0].student.parent.email, :subject => "Your LinguaZone Application")
  end
  
  def registration_canceled(reg)
    @reg = reg
    mail(:to => @reg.student.parent.email, :subject => "[CANCELED] Update on your LinguaZone Application")
  end
end
