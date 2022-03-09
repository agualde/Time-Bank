class Message < ApplicationRecord
  after_create :create_notification
  belongs_to :chatroom
  belongs_to :user
  has_many :notifications, dependent: :destroy

  validates :content, length: { minimum: 1 }


  def create_notification
    notification = Notification.new
    notification.user = chatroom.other_person(user)
    notification.chatroom = chatroom
    notification.message = self

    notification.save
  end
end
