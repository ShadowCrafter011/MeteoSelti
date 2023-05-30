import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

// Connects to data-controller="time-zone"
export default class extends Controller {
  connect() {
    const queryString = location.search;
    const urlParams = new URLSearchParams(queryString);

    const time_zone = Intl.DateTimeFormat().resolvedOptions().timeZone;
    const locale = navigator.language;
    const path = urlParams.get("p") || location.pathname;
    Turbo.visit(`setup?t=${time_zone}&l=${locale}&p=${path}`);
  }
}
