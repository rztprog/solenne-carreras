import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["nav", "navbarList"];

  connect() {
    window.addEventListener("scroll", () => {
      this.navTarget.classList.toggle("sticky-nav", window.scrollY > 0);

      // Fix navbarlist height when scrollY > 0
      if (window.scrollY > 0) {
          this.navbarListTarget.style.height =  "calc(100% - 73px)";
      } else {
        this.navbarListTarget.style.height =  "";
      }
    })
  }
}
