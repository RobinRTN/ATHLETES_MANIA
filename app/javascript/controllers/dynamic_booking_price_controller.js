import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dynamic-booking-price"
export default class extends Controller {
  static targets = [ 'startDateInput', 'endDateInput', 'priceHolder', 'duration', 'total' ]
  static values = { price: Number }

  updatePrice() {
    const startDate = this.startDateInputTarget.value
    const endDate = this.endDateInputTarget.value
    const days = this.#diffInDays(startDate, endDate)
    let status = "pending"
    const totalValue = this.#totalValue(days)
    this.#setPriceValue(totalValue)
    this.totalTarget.value = totalValue
    this.durationTarget.value = days
  }

  #setPriceValue(value) {
    this.priceHolderTarget.innerText = value
  }

  #diffInDays(startDate, endDate) {
    if (startDate && endDate) {
      const diffTime = (Date.parse(endDate) - Date.parse(startDate))
      var days = Math.ceil(diffTime / (1000 * 60 * 60 * 24))
    } else {
      var days = 0
    }
    return days + 1
  }

  #totalValue(days) {
    return (days) * this.priceValue
  }
}
