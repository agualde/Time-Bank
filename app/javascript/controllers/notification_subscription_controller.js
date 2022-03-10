import { Controller } from "stimulus"
import consumer from '../channels/consumer'

export default class extends Controller {
    static targets = ['count']

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
            }
            })
    }
}