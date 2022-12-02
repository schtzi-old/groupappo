import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    console.log('hello')
    new flatpickr(this.element, {
      enableTime: true,
      minDate: new Date()
    });
  }
}
