import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["image"]

  connect() {
    console.log("Hola")
  }

  revealBio() {
    this.imageTarget.innerHTML("<p>This paragraph replaced the original div.</p>")
  }
}
