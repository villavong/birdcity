ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address            => 'smtp.sendgrid.net',
  :port               => '587',
  :authentication     => :plain,
  :user_name          => 'app45626912@heroku.com',
  :passwords          => '9a4luqmz5298',
  :domain             => 'heroku.com',
  :enable_starttls_auto => true
}
