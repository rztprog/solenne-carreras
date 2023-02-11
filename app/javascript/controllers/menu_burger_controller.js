import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["desktopList", "burger", "body", "span1", "span2", "span3"];

  // connect() {
  //   console.log("Menu burger stimulus controller connected !")
  // }

  action() {
    this.desktopListTarget.classList.toggle("active");
    this.burgerTarget.classList.toggle("active");
    this.bodyTarget.classList.toggle("hidden");

    this.span1Target.classList.toggle("span1");
    this.span2Target.classList.toggle("span2");
    this.span3Target.classList.toggle("span3");
  }
}
