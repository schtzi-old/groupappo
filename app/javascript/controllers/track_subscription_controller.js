import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="track-subscription"
export default class extends Controller {
  static values = { trackId: Number }
  static targets = ["trackImage", "totalVm", "totalKm"]

  connect() {
    console.log('connected to subsrciption')
    this.channel = createConsumer().subscriptions.create(
      { channel: "TracksChannel", id: this.trackIdValue },
      {
        received: (data) => {this.#insertInfo(data)}
      }
     )
  }

  #insertInfo(data) {
    console.log(data)
    this.totalVmTarget.innerHTML = `${data.totalVm} m`
    this.totalKmTarget.innerHTML = `${data.totalKm} km`
    // this.trackImageTarget.innerHTML = ''

    this.trackImageTarget.src = new Image().src = `${data.trackImage}`
  }
}
