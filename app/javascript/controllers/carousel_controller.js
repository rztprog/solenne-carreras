import { Controller } from "@hotwired/stimulus"
import { Carousel } from "./carouselClass"

export default class extends Controller {
  static targets = ["carousel1"];

  connect() {
    new Carousel(this.carousel1Target, {
      slidesToScroll: 1,
      slidesVisible: 3,
      loop: false
    });
  }
}
