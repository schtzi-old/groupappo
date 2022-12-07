import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="delete-notifications-list"
export default class extends Controller {
  static targets = ["table"]

  connect() {
    console.log(this.tableTarget)
  }

  remove(event) {
    // console.log(this.tableTarget)
    this.tableTarget.remove()
  }
}
