import { Controller } from "stimulus"
import consumer from '../channels/consumer'

export default class extends Controller {
    static targets = ['count', 'other']

    connect () {
        const userId = this.element.dataset.userId;
        console.log(userId)
        consumer.subscriptions.create(
            { channel: 'UserChannel', id: userId },
            {
                // when you receive something
            received: (data) => {
                // update the DOM
                console.log(data)
                this.countTarget.classList.add("circle")
                this.countTarget.innerHTML = data.unread_messages
                // this.otherTarget.classList.add("circle")
                // this.otherTarget.innerHTML = data.unread_messages 
            }
            })
    }
}