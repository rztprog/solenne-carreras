class Contact < MailForm::Base
  attribute :name,      validate: true
  attribute :surname,   validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   validate: true

  # def headers
  #   { 
  #     to: "spitemplar@gmail.com", # change this to be the email you want sent to
  #     subject: "Solenne-Carreras - Nouveau message de #{surname}",
  #     # Changer le mail dans l'environement de development
  #     from: %("#{name} #{surname}" <#{email}),  # change this to be the email it is coming from
  #     reply_to: %("#{name} #{surname}" <#{email}>) 
  #   }
  # end
end
