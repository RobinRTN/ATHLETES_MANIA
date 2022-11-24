import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['bookings', 'rentals', 'collection']

  hideBookings(event) {
  this.bookingsTarget.classList.toggle('d-none');
  if (this.bookingsTarget.classList == "") {
    event.currentTarget.innerHTML = "🔼";
  } else {
    event.currentTarget.innerHTML = "🔽";
  }
  event.preventDefault();
  }

  hideRentals(event) {
    this.rentalsTarget.classList.toggle('d-none');
    if (this.rentalsTarget.classList == "") {
      event.currentTarget.innerHTML = "🔼";
    } else {
      event.currentTarget.innerHTML = "🔽";
    }
    event.preventDefault();
  }

  hideCollection(event) {
    this.collectionTarget.classList.toggle('d-none');
    if (this.collectionTarget.classList == "") {
      event.currentTarget.innerHTML = "🔼";
    } else {
      event.currentTarget.innerHTML = "🔽";
    }
    event.preventDefault();
  }
}
