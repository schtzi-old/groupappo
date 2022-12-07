import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-filter"
export default class extends Controller {
  static targets = ['slider', 'label']

  connect() {
    this.labelTarget.innerHTML = `Range: ${this.sliderTarget.value} km`
  }

  change() {
    console.log(this.sliderTarget.value)
    this.labelTarget.innerHTML = `Range: ${this.sliderTarget.value} km`
  }
}
