class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :sent]
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if ContactMailer.contact(@contact).deliver
      redirect_to action: :sent
    else
      render :new, status: :unprocessable_entity
    end
  end

  def sent
  end
end
