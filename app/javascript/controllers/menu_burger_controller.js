import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"];

  // connect() {
  //   console.log("Menu burger stimulus controller connected !")
  // }

  action() {
    this.menuTarget.classList.toggle("active");
  }
}