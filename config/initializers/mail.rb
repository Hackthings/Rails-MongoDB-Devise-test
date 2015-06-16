MANDRILL_API_KEY = 'YOUR_API_KEY'
ActionMailer::Base.smtp_settings = {
    address: 'smtp.mandrillapp.com',
    port: 2525,
    enable_starttls_auto: true,
    user_name: 'YOUR_EMAIL_HERE',
    password: MANDRILL_API_KEY,
    authentication: 'login'
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: 'utf-8'