class RegistrationObserver < ActiveRecord::Observer
  def after_create(reg)
    puts "Registration created. Sending email."
    RegistrationMailer.application_received(reg).deliver
  end
  
  def before_destroy(reg)
    puts "Registration created. Sending email."
    RegistrationMailer.registration_canceled(reg).deliver
  end
  
end
