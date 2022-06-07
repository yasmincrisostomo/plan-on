import Rails from "@rails/ujs"
import { Controller } from "stimulus"

window.Rails = require("@rails/ujs")

export default class extends Controller {
  static targets = ["form" ]

  connect() {
  }

  update(event) {
    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
      })
  }
}
