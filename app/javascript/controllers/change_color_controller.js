import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="change-color"
export default class extends Controller {
  static targets = ["input"]
  connect() {
    console.log(this.inputTarget)
  }
  update() {
    console.log(this.inputTarget)
  }
}
