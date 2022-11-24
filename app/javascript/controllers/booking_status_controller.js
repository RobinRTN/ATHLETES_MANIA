import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-status"
export default class extends Controller {

  connect() {
    console.log("Hello");
  }

  disable(event) {
    console.log("on rentre bien dans la methode")
    console.log(event.currentTarget)
    // this.element.classList.add("btn hidden");
    event.currentTarget.classList.add("d-none")
  }
}
