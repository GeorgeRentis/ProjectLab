class ContactMessagesController < ApplicationController


  def index
    @contact_messages = ContactMessage.all
  end

  def create
    @contact_message = ContactMessage.new(contact_message_params)
    if @contact_message.save
      flash[:success] = "Message sent"
      redirect_to root_path
    else
      flash[:danger] = "Cannot send message"
      redirect_to root_path
    end
  end

  def new
    @contact_message = ContactMessage.new
  end

  def show
    @contact_message = ContactMessage.find(params[:id])
    @contact_message.read = true
    @contact_message.save
  end

  def contact_message_params
    params[:contact_message].permit(:first_name,:last_name,:subject,:email,:message)
  end
end
