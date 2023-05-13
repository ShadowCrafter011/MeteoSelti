import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer"

// Connects to data-controller="index"
export default class extends Controller {
  connect() {
    this.subscription = consumer.subscriptions.create("MeasurementChannel", {
      received: this.handle_measurement.bind(this)
    });
  }

  handle_measurement(data) {
    if (data.action != "new") return;

    this.element.reload();
  }

  disconnect() {
    this.subscription.unsubscribe();
  }
}
