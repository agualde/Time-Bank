// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "content", "other" ]

  revealContent() {
    this.contentTarget.classList.toggle("d-none")
    this.otherTarget.classList.toggle("d-none")
  }
}
