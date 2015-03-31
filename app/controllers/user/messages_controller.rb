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
  end

  def create
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
end
