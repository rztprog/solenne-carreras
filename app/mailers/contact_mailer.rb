class ContactMailer < ApplicationMailer
  def contact(data)
    @data = data
    mail(to: 'spitemplar@gmail.com', subject: "Nouveau message de #{@data.surname + ' ' + @data.name}")
  end
end
