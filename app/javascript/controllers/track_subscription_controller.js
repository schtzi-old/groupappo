import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="track-subscription"
export default class extends Controller {
  static values = { trackId: Number }
  static targets = ["trackImage", "totalVm", "totalKm"]

  connect() {
    console.log(`Found ${this.trackIdValue}`)
    console.log(this.trackImageTarget)
    console.log(this.totalVmTarget)
    console.log(this.totalKmTarget)
    this.channel = createConsumer().subscriptions.create(
      { channel: "TracksChannel", id: this.trackIdValue },
      { received: data => console.log(data) }
      )
  }
}
