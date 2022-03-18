import { Controller } from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"


export default class extends Controller {

  static targets = ["favourite"]


  connect() {
    console.log("hellooooo!")

  }

  favourite(event) {
    event.preventDefault();
    console.log(this)
    // console.log(this.element.href);
    event.stopImmediatePropagation()
    const url = this.element.href;
    // fetch POST request to link url
    fetch(url, {
    method: "POST",
    headers: {
      "Accept": "text/plain",
      "X-CSRF-Token": csrfToken()
    }
  })
    .then(response => response.text())
    .then((data) => {
      // console.log(data)
      this.element.outerHTML = data;
    })
}

deleteFavourite(event) {
  event.preventDefault();
  event.stopImmediatePropagation()
  console.log(this.element.href);
  const url = this.element.href;
  // fetch POST request to link url
  fetch(url, {
  method: "DELETE",
  headers: {
    "Accept": "text/plain",
    "X-CSRF-Token": csrfToken()
  }
})
  .then(response => response.text())
  .then((data) => {
    console.log(data)
    this.element.outerHTML = data;
  })
}

  }