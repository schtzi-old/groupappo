import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification-subscription"
export default class extends Controller {
  static targets = ["notification-count"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "Noticed::NotificationChannel" },
      { received: data => this.received(data) }
    )
    console.log(`Subscribe to notifications`)
  }

  received(data) {
    console.log(data)
  }

  // #setUnread {
  //   this.
  // }
}
