class RegistrationMailer < ActionMailer::Base
  default :from => "LinguaZone Academy <info@lzacademy.com>"
  default_url_options[:host] = "lzacademy.com"
  
  def application_received(regs)
    @regs = regs
    mail(:to => "colinangevine@gmail.com", :subject => "Your LinguaZone Application")
  end
  
  def registration_canceled(reg)
    @reg = reg
    mail(:to => "colinangevine@gmail.com", :subject => "[CANCELLED] Update on your LinguaZone Application")
  end
end
