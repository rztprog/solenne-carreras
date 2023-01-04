import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "open", "close"];

  // connect() {
  //   console.log("Menu burger stimulus controller connected !")
  // }

  action() {
    this.menuTarget.classList.toggle("active");
    this.openTarget.classList.toggle("active");
    this.closeTarget.classList.toggle("active");
  }
}