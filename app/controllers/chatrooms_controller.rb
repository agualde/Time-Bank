class ChatroomsController < ApplicationController
  
  def index
    @chatrooms = Chatroom.where(sender_id: current_user).or(Chatroom.where(receiver_id: current_user))
    # SELECT * FROM chatrooms WHERE sender_id = 1 OR receiver_id = 1
  end
  
  def create
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
