import { Controller } from "stimulus"
import consumer from '../channels/consumer'

export default class extends Controller {
    static targets = ['count', 'other']

    connect () {
        const userId = this.element.dataset.userId;
        
        consumer.subscriptions.create(
            { channel: 'UserChannel', id: userId },
            {
                // when you receive something
                received: (data) => {
                // update the DOM
                console.log(data)
                // console.log(chatroom)
                this.countTarget.classList.add("circle")
                this.countTarget.innerHTML = data.unread_messages
                console.log(data.chatroom)
                var chatroom = document.getElementById(data.chatroom);
                console.log(chatroom)
                chatroom.classList.add("circle")
                chatroom.innerHTML = data.chatroom_messages
            }
            })
    }
}