import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

// Connects to data-controller="time-zone"
export default class extends Controller {
  connect() {
    const time_zone = Intl.DateTimeFormat().resolvedOptions().timeZone;
    const locale = navigator.language;
    const path = location.pathname;
    Turbo.visit(`timezone?t=${time_zone}&l=${locale}&p=${path}`);
  }
}
