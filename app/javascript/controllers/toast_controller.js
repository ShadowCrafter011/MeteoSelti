import { Controller } from "@hotwired/stimulus"
import $ from "jquery"
import "bootstrap"

// Connects to data-controller="toast"
export default class extends Controller {
  connect() {
    let toast_id = $(this.element).data("toast-id");
    let toast_element = $(`#${toast_id}`)
    this.toast = bootstrap.Toast.getOrCreateInstance(toast_element);
  }

  show() {
    this.toast.show();
  }
}
