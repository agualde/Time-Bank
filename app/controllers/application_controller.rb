class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :get_chats
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end



  private

  def get_chats
    @chatrooms = Chatroom.where(sender_id: current_user).or(Chatroom.where(reciever_id: current_user))
  end
end
