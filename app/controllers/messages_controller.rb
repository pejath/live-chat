class MessagesController < ApplicationController
  def create
    @message = current_user.messages.build(messages_params)

    if @message.save!
      ActionCable.server.broadcast "chat_#{@message.chat_id}", { message: @message, nickname: current_user.nickname, action: "post" }
    else
      redirect_to chat_path(@message.chat_id)
    end
  end

  def destroy
    @message = Message.find(params[:id])
    if current_user == @message.user
      @message.destroy
      ActionCable.server.broadcast "chat_#{@message.chat_id}", { message_id: @message.id, action: "destroy" }
    end
  end

  private

  def messages_params
    params.require(:message).permit(:body, :chat_id)
  end
end
