class ContactMessagesController < ApplicationController


  def index
    @contact_messages = ContactMessage.all
  end

  def create
    @contact_message = ContactMessage.new(contact_message_params)
    if @contact_message.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def new
    @contact_message = ContactMessage.new
  end

  def show
    @contact_message = ContactMessage.find(params[:id])
  end

  def contact_message_params
    params[:contact_message].permit(:first_name,:last_name,:subject,:email,:message)
  end
end
