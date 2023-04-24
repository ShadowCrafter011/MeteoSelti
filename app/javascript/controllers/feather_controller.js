import { Controller } from "@hotwired/stimulus"
import feather from "feather-icons"

// Connects to data-controller="feather"
export default class extends Controller {
  connect() {
    feather.replace();
  }
}
