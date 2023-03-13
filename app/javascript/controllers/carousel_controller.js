import { Controller } from "@hotwired/stimulus"
import { Carousel } from "./carouselClass"

export default class extends Controller {
  static targets = ["carouselHome"];

  connect() {
    new Carousel(this.carouselHomeTarget, {
      slidesToScroll: 1,
      slidesVisible: 3,
      loop: false,
      infinite: true
    });
  }
}
