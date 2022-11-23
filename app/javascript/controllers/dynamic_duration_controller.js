import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dynamic-duration"
export default class extends Controller {
  static targets = [ 'startDateInput', 'endDateInput', 'dateHolder' ]
  connect() {
  }
}
