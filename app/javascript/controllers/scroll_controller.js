import { Controller } from "@hotwired/stimulus"
import { end } from "@popperjs/core"

export default class extends Controller {
  static target = ['shadow']

  connect() {
    console.log("Hello")
  }

  downScroll() {
    if (window.scrollY >= (window.innerHeight)/3) {
      console.log('worked')
      this.element.classList.remove("carrousel-shadow-off")
      this.element.classList.add("carrousel-shadow-on")
    }
    else {
      this.element.classList.remove("carrousel-shadow-on")
      this.element.classList.add("carrousel-shadow-off")
    }
  }
}
