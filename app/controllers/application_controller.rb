class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :get_chats

  private

  def get_chats
    @chatrooms = Chatroom.where(sender_id: current_user).or(Chatroom.where(reciever_id: current_user))
  end
end
