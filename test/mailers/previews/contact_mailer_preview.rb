# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact
    ContactMailer.contact(
      Contact.new(
      name: "John", 
      surname: "Doe", 
      email: "emailpreview@gmail.com", 
      message: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ex, veritatis vel ut laudantium vitae cupiditate ullam ratione? Dicta sunt, amet, error dignissimos esse officia enim, distinctio hic expedita maiores omnis."
      )
    )
  end
end
