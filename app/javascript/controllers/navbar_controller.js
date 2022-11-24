import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
    console.log("navbar controller connected")
  }

  updateNavbar() {
    console.log("ok on scroll à mort")
    if (window.scrollY >= window.innerHeight/3) {
      this.element.classList.add("navbar-white")
    } else {
      this.element.classList.remove("navbar-white")
    }
  }
}
