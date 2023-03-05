import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["nav"];

  connect() {
    window.addEventListener("scroll", () => {
      this.navTarget.classList.toggle("sticky-nav", window.scrollY > 0);
    })
  }
}
