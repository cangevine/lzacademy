class RegistrationMailer < ActionMailer::Base
  default :from => "LinguaZone Academy <info@lzacademy.com>"
  default_url_options[:host] = "lzacademy.com"
  
  def application_received(regs)
    @regs = regs
    mail(:to => @regs[0].student.parent.email, :bcc => "info@lzacademy.com, magistraroberts@hotmail.com",
              :subject => "Your LinguaZone Application")
  end
  
  def registration_canceled(reg)
    @reg = reg
    mail(:to => @reg.student.parent.email, :bcc => "info@lzacademy.com, magistraroberts@hotmail.com",
              :subject => "[CANCELED] Update on your LinguaZone Application")
  end
end
