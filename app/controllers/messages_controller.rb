class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    other = @chatroom.other_person(current_user)
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "messages/message", locals: {message: @message})
      )
      UserChannel.broadcast_to(
        other,
        { unread_messages: other.notifications.count }
      )
      head :ok
    else
      render "chatrooms/show"
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
