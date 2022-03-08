class Chatroom < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :reciever, class_name: "User"

  has_many :messages, dependent: :destroy

  validates_uniqueness_of :sender_id, :scope => [:reciever_id]

  def other_person(me)
   if sender == me
     return reciever
   else
    return sender
   end
  end
end
