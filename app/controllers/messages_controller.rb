class MessagesController < ApplicationController

  def index
    @group  = Group.find(params[:group_id])
    @groups = current_user.groups
    @message = Message.new
    @messages = @group.messages.order("created_at ASC")
  end

  def create
    @message = Message.new(message_params)
    @group  = Group.find(params[:group_id])
    @groups = current_user.groups
    @messages = @group.messages.order("created_at ASC")
    if @message.save
      redirect_to group_messages_path
    else
      flash.now[:alert] = "メッセージを入力してください。"
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
