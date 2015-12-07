class User::MessagesController < ApplicationController
  before_action :find_message,only:[:show]
  def index
  end

  def received
    @messages = Message.where(receiver_id: current_user.id)
  end

  def sent
    @messages = Message.where(sender_id: current_user.id)
  end

  def show
    @message.read = true
    @message.save
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = "Message sent"
      redirect_to root_path
    else
      flash[:danger] = "Cannot send message"
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def find_message
    @message = Message.find(params[:id])
  end

  def message_params
    params[:message].permit(:title,:body,:receiver_id,:sender_id)
  end
end
