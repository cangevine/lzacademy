# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Lzacademy::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "spring.joyent.us",
  :port                 => 25,
  :domain               => "spring.joyent.us",
  :user_name            => "info-linguazone",
  :password             => "tamina01",
  :authentication       => :plain
}