class MessagesController < ApplicationController
  before_action :set_group

  def index
    @messages = Message.all.uniq
    @messages = @group.messages.includes(:user)
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params.require(:message).permit(:name, :attachment))
    @message.save
    @message = @group.messages.new(message_params)
      if @message.save
        redirect_to group_messages_path#, notice: "The message #{@message.name} has been uploaded."
      else
        render "new"
      end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to group_messages_path
  end

private
  def message_params
    params.require(:message).permit(:name, :attachment).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
