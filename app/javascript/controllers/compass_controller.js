import { Controller } from "@hotwired/stimulus"
import $ from "jquery"

// Connects to data-controller="compass"
export default class extends Controller {
  static targets = [ "pointer" ]

  connect() {
    const compass = $(this.element);
    const rotation = compass.data("rotation");
    const pointer = $(this.pointerTarget);
    pointer.css("transform", `rotate(${rotation}deg)`);
    pointer.css("visibility", "visible");
  }
}
