import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["fadeinImageContainer"];

  connect() {
    window.addEventListener("scroll", () => {
      this.fadeinImageContainerTargets.forEach((image) => {
        const position = image.offsetTop;
        const scroll = window.scrollY;
        const windowHeight = window.innerHeight;

        if (scroll > position - windowHeight + 100) {
          image.classList.add("fade-in-visible");
        }

        if (scroll < position - windowHeight + 100) {
          image.classList.remove("fade-in-visible");
        }
      })
    })
  }
}
