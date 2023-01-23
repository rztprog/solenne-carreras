class Contact < MailForm::Base
  attribute :name
  attribute :surname
  attribute :email
  attribute :message

  def headers
    { to: "l.broion@ħotmail.fr" }
  end
end
