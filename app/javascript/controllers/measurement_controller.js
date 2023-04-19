import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"
import $ from "jquery"

// Connects to data-controller="measurement"
export default class extends Controller {
  connect() {
    this.subscription = consumer.subscriptions.create("MeasurementChannel", {
      received: this.handle_measurement
    });
  }

  handle_measurement(data) {
    if (data.action != "new") return;

    let frames = $(".measurement-frame");

    if ((frames.length - 1) * data.per_frame < data.total) {
      let frame = $("#measurement-frame-empty").clone();
      let frame_id = frames.length - 1;
      frame.appendTo("#measurements");
      frame.attr("id", frame.attr("id").replace("empty", frame_id));
      frame.attr("src", frame.attr("src").replace("empty", frame_id));
      frame.removeClass("d-none");
    }

    frames.each(index => frames[index].reload());
  }

  disconnect() {
    this.subscription.unsubscribe();
  }
}
