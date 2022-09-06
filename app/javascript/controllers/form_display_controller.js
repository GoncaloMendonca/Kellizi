import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "input" ]

  connect() {
    console.log("hello form display")
  }

  showInputs(event) {
    console.log(event.currentTarget.value)
    if(event.currentTarget.value === "work") {
      this.inputTargets.forEach(input => {
        input.classList.add("d-none");
      });
    } else {
      this.inputTargets.forEach(input => {
        input.classList.remove("d-none");
      });
    }
  }
}
