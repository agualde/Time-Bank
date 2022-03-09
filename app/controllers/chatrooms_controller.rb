class ChatroomsController < ApplicationController
  
  def index
    @chatrooms = Chatroom.where(sender_id: current_user).or(Chatroom.where(reciever_id: current_user))
    # SELECT * FROM chatrooms WHERE sender_id = 1 OR receiver_id = 1
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'shared/index', locals: { chatrooms: @chatrooms }, formats: [:html] }
    end
  end
  
  def create
    @chatroom = Chatroom.new
    @chatroom.sender = current_user
    @chatroom.reciever = User.find(params[:user_id])
    
    if  @chatroom.sender == @chatroom.reciever
      redirect_to dashboard_path, alert: "Stop it"
    else
      if @chatroom.save
        redirect_to chatroom_path(@chatroom)
      else
        redirect_to dashboard_path
      end
    end

  end
  
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'chatrooms/chatroom', locals: { chatroom: @chatroom, message: @message }, formats: [:html] }
    end

    if @chatroom.other_person(current_user)
      @chatroom.notifications.each do |notification|
          notification.read = true
          notification.destroy
      end
    end
  end

  def destroy
    
  end
end
