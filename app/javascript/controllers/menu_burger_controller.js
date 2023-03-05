import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["desktopList", "burger", "body", "span1", "span2", "span3", "nav"];

  connect() {
    window.addEventListener("resize", () => {
      if (window.innerWidth >= 1100 && this.desktopListTarget.classList.contains("active")) {
        this.action();
      }
    });
  }

  action() {
    this.desktopListTarget.classList.toggle("active");
    this.burgerTarget.classList.toggle("active");
    this.bodyTarget.classList.toggle("hidden");

    this.span1Target.classList.toggle("span1");
    this.span2Target.classList.toggle("span2");
    this.span3Target.classList.toggle("span3");
    this.navTarget.classList.toggle("static-nav");
  }
}
