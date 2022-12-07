import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification-subscription"
export default class extends Controller {
  static targets = ["notification-count", "count"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "Noticed::NotificationChannel" },
      { received: data => this.received(data) }
    )
    console.log(`Subscribe to notifications`)
  }

  received(data) {
    location.reload()
    console.log(parseInt(this.countTarget.innerHTML,10) + 1)

    // const counter = document.getElementById("notification-count")
    // counter.addEventListener("change", (event) => {
    //   console.log(event.innerHTML)
    // })
    // // counter.innerHTML = "10"
    // const count = parseInt(counter.innerText, 10);
    // console.log(count);
    // if count > 0
    //   counter.innerText = (count + 1).toString();
    // else
    //   counter.innerText = "1";
    // end
  }
}
