class Admin::MessagesController < Admin::AdminController

  def index
    @messages = Message.all
  end

  def sent
    @messages = Message.where(sender_id: current_user.id)
  end

  def received
    @messages = Message.where(receiver_id: current_user.id)
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(admin_message_params)
    @message.sender_id = current_user.id
    if @message.save
      flash[:success] = "Message sent"
      redirect_to admin_messages_path
    else
      flash[:danger] = "Cannot create."
      redirect_to new_admin_messages_path
    end
  end

  def destroy
  end

  def talks
    @user = User.where(email: params[:email]).first
    @messages = Message.where(sender_id: [current_user.id,@user.id]).where(receiver_id: [current_user.id,@user.id]).order(:created_at)
  end

  def admin_message_params
    params[:message].permit(:sender_id,:receiver_id,:title,:body)
  end

end
