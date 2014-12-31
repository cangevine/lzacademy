source 'http://rubygems.org'
ruby "1.9.3"
gem 'rails', '3.0.3'

#gem 'mysql2', '< 0.3'
gem 'pg'
gem 'devise'
gem 'cancan'
gem 'formtastic', '2.1.0'
gem 'unicorn'
gem 'airbrake'
gem 'newrelic_rpm'

group :development, :test do
	gem 'debugger'
	gem 'fabrication'
	gem 'taps'
end

group :development do
	gem 'rspec-rails', '2.0.1'
	gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
end

group :test do
	gem 'rspec', '2.0.1'
	gem 'cucumber-rails'
	gem 'capybara'
	gem 'database_cleaner'
	gem 'launchy'
	gem 'email_spec'
end
