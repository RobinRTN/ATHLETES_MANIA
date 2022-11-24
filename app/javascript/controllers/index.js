// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import BookingStatusController from "./booking_status_controller"
application.register("booking-status", BookingStatusController)

import DynamicBookingPriceController from "./dynamic_booking_price_controller"
application.register("dynamic-booking-price", DynamicBookingPriceController)

import FlatpickrController from "./flatpickr_controller"
application.register("flatpickr", FlatpickrController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import ToggleController from "./toggle_controller"
application.register("toggle", ToggleController)
