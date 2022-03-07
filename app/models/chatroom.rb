class Chatroom < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :reciever, class_name: "User"

  has_many :messages, dependent: :destroy
end
