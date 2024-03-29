import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dropdown", "dropdownmobile"];

  // connect() {
  //   console.log("Avatar dropdown stimulus controller connected !")
  // }

  action() {
    // console.log("Click on dropdown")
    this.dropdownTarget.classList.toggle("d-none");
  }

  actionmobile() {
    this.dropdownmobileTarget.classList.toggle("d-none");
  }
}
