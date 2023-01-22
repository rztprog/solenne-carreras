import { Application } from '@hotwired/stimulus'
import Carousel from 'stimulus-carousel'

const application = Application.start()
application.register('carousel', Carousel)

let slides = 3; 

export default class extends Carousel {
  connect() {
    super.connect()
    // console.log('Do what you want here.')

    // The swiper instance.
    // this.swiper

    // Default options for every carousels.
    this.defaultOptions
  }

  // You can set default options in this getter.
  get defaultOptions() {

    return {
      // Your default options here
        slidesPerView: slides,
        slidesPerGroup: 1,
        loop: true,
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        }
    }
  }
}

window.addEventListener("resize", function () {
  if (window.innerWidth < 730) {
    slides = 1;
  } else {
    slides = 3;
  }
});
