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
  static targets = [ "content", "other", "third" ]

  revealContent() {    
    let base_url = window.location.origin;
    let specific_url = window.location.pathname
    const complete_url = base_url + specific_url
    window.history.pushState({}, document.title, "/" );
    fetch("chatrooms", {
      headers: { "Accept": "text/plain" }
    })
    .then((res) => res.text())
    .then((data) => {
      this.contentTarget.innerHTML = data
      window.history.pushState({}, document.title, complete_url );
    })

    this.contentTarget.classList.toggle("d-none")
    this.otherTarget.classList.toggle("d-none")
}
}
