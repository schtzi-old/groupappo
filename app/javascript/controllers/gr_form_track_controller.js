import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="gr-form-track"
export default class extends Controller {
  static targets = ['radio', 'selector', 'form']

  new() {
    this.formTarget.classList.remove('d-none')
    this.selectorTarget.classList.add('d-none')
  }

  select() {
    this.formTarget.classList.add('d-none')
    this.selectorTarget.classList.remove('d-none')
  }
}
