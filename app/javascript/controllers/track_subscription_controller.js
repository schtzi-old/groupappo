import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="track-subscription"
export default class extends Controller {
  static values = { trackId: Number }
  static targets = ["image", "totalVm", "totalKm"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "TracksChannel", id: this.trackIdValue },
      { received: data => console.log(data) }
    )
    console.log(`Subscribed to the track with the id ${this.trackIdValue}.`)
    console.log(this.imageTarget)
    console.log(this.totalVmTarget)
  }
}
