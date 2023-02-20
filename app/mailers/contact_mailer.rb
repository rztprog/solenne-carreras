class ContactMailer < ApplicationMailer
  def contact
    mail(to: "", subject: "test")
  end
end
