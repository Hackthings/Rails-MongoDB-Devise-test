class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'
  
  def mandrill_client
    @mandrill_client ||= Mandrill::API.new MANDRILL_API_KEY
  end
end
