import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["accordionList", "accordionCross"];

  connect() {
    // console.log(this.accordionListTargets);
  }

  action(event) {
    let index = event.target.dataset.index;

    this.accordionListTargets[index].classList.toggle("accordion-list-close");
    this.accordionCrossTargets[index].classList.toggle("rotate-span");
  }
}
