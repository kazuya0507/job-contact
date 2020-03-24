class MessagesController < ApplicationController
  def index
    @messages = Message.all.uniq
  end

  def new
    @message = Message.new
  end

  def create
    # byebug

    # Resume.create(name: params.require(:resume)[:name], attachment: params.require(:resume).permit(:attachment))

    # Message.create(name: params.require(:message)[:name], attachment:  params.require(:message)[:attachment])
    


    @message = Message.new(params.require(:message).permit(:name, :attachment))
    @message.save
    # @resume = Resume.new(params.require(:resume).permit(:name, :attachment1))
    # @resume.save
    # @resume = Resume.new(params.require(:resume).permit(:name, :attachment2))
    # @resume.save
    # @resume = Resume.new(params.require(:resume).permit(:name, :attachment3))


    # # byebug
    if @message.save
    redirect_to messages_path#, notice: "The message #{@message.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path, notice:  "The PDF #{@message.name} has been deleted."
  end

private
  def message_params
    params.require(:message).permit(:name, :attachment).merge(user_id: current_user.id)
  end
end
