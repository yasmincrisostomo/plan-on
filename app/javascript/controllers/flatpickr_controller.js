import { Controller } from "@hotwired/stimulus"
import { initFlatpickr } from "../plugins/flatpickr"

export default class extends Controller {
  connect() {
    initFlatpickr();
  }
}
