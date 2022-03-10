class UserChannel < ApplicationCable::Channel
  def subscribed
    puts "*" * 100
    # puts current_user.id
    user = User.find(params[:id])
    stream_for user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
