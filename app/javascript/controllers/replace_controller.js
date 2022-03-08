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
  static targets = [ "output" ]

  connect() {
    console.log('Hello, Stimulus!')
  }

  render(event) {
    event.preventDefault()
    console.log(event.target)
    
    fetch(event.target.href, {
      headers: { "Accept": "text/plain" }
    })
    .then((res) => res.text())
    .then((data) => {
      this.outputTarget.innerHTML = data
      var objDiv = document.getElementById("messages");
      objDiv.scrollTop = objDiv.scrollHeight;
      console.log(objDiv)
    })
  }
}
