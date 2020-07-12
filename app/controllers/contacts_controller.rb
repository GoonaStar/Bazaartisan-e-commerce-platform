class ContactsController < ApplicationController

  def new 
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
  redirect_to root_path, notice: "Message sent"
    else
      flash.now[:error] = "Your message could not have been sent"
      render :new
    end
  end

end
