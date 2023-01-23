class Contact < MailForm::Base
  attribute :name,      validate: true
  attribute :surname,   validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   validate: true

  def headers
    { 
      to: "l.broion@ħotmail.fr", # change this to be the email you want sent to
      subject: "Solenne Carreras Contact",
      from: "admin@yourdomain.com",  # change this to be the email it is coming from
      reply_to: %("#{name}" <#{email}>) 
    }
  end
end
