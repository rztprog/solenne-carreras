export class Carousel {
  constructor (element, options = {}){
    this.element = element;
    this.options = Object.assign({}, {
      slidesToScroll: 1,
      slidesVisible: 1,
      infinite: false
    }, options);
    let children = [].slice.call(element.children);

    this.isMobile = false;
    this.isMobileTwo = false;
    this.isTablet = false;
    this.currentItem = 0;

    this.root = this.createDivWithClass("carousel");
    this.root.setAttribute("tabindex", "0");
    this.container = this.createDivWithClass("carousel-container");

    this.root.appendChild(this.container);
    this.element.appendChild(this.root);

    this.items = children.map((child) => {
      let item = this.createDivWithClass("carousel-item");
      item.appendChild(child);
      return item;
    })

    if (this.options.infinite) {
      this.offset = this.options.slidesVisible * 2;
      this.items = [
        ...this.items.slice(this.items.length - this.offset).map(item => item.cloneNode(true)),
        ...this.items,
        ...this.items.slice(0, this.offset).map(item => item.cloneNode(true))
      ]
      this.gotoItem(this.offset, false, false);
    }

    this.items.forEach(item => this.container.appendChild(item));

    // Permet de ne pas voir les images au chargement
    this.element.style.display = "block";
    this.root.style.display = "block";

    this.setStyle();
    this.createNavigation();

    this.onWindowResize();
    window.addEventListener("resize", this.onWindowResize.bind(this));

    this.root.addEventListener("keyup", (e) => {
      if (e.key === "ArrowRight") {
        this.nextPic();
      } else if (e.key === "ArrowLeft") {
        this.prevPic();
      }
    })

    if (this.options.infinite) {
      this.container.addEventListener('transitionend', this.resetInfinite.bind(this));
    }
  }

  onWindowResize () {
    let mobile = window.innerWidth < 550;
    let mobileTwo = window.innerWidth < 800;
    let tablet = window.innerWidth < 1100 && window.innerWidth > 800;

    if (tablet !== this.isTablet) {
      this.isTablet = tablet;
      this.setStyle();
    }

    if (mobileTwo !== this.isMobileTwo) {
      this.isMobileTwo = mobileTwo;
      this.setStyle();
    }

    if (mobile !== this.isMobile) {
      this.isMobile = mobile;
      this.setStyle();
    }
  }

  createDivWithClass (className) {
    let div = document.createElement('div');
    div.setAttribute('class', className);
    return div;
  }

  createIconWithClass (className) {
    let icon = document.createElement('i');
    icon.setAttribute('class', className);
    return icon;
  }

  setStyle () {
    let ratio = this.items.length / this.slidesVisible;
    this.container.style.width = (ratio * 100) + "%";

    this.items.forEach(item => {
      item.style.width = (100 / this.slidesVisible / ratio) + "%";
    });
  }

  createNavigation() {
    let prevButton = this.createDivWithClass("carousel-prev carousel-button");
    let nextButton = this.createDivWithClass("carousel-next carousel-button");

    let iconRightToLeft = this.createIconWithClass("fa-solid fa-arrow-left-long");
    let iconLeftToRight = this.createIconWithClass("fa-solid fa-arrow-right-long");

    prevButton.appendChild(iconRightToLeft);
    nextButton.appendChild(iconLeftToRight);

    this.root.appendChild(prevButton);
    this.root.appendChild(nextButton);

    prevButton.addEventListener('click', this.prevPic.bind(this));
    nextButton.addEventListener('click', this.nextPic.bind(this));
  }

  nextPic(){
    this.gotoItem(this.currentItem + this.slidesToScroll);
  }

  prevPic(){
    this.gotoItem(this.currentItem - this.slidesToScroll, true);
  }

  gotoItem (index, previewPress, animation = true){
    if (index < 0) {
      index = this.items.length - this.slidesVisible;
    } else if (index >= this.items.length || this.items[this.currentItem + this.slidesVisible] === undefined)  {
      previewPress ? index : index = 0;
    }
    let translateX = index * -100 / this.items.length;

    if (animation === false) {
      this.container.style.transition = "none";
    }
    this.container.style.transform = `translate3D(${translateX}%, 0, 0)`;

    this.container.offsetHeight // Repaint
    if (animation === false) {
      this.container.style.transition = "";
    }

    this.currentItem = index;
  }

  resetInfinite () {
    if(this.currentItem <= this.options.slidesToScroll) {
      this.gotoItem(this.currentItem + (this.items.length - 2 * this.offset), false, false)
    } else if (this.currentItem >= this.items.length - this.offset) {
      this.gotoItem(this.currentItem - (this.items.length - 2 * this.offset), false, false)
    }
  }

  get slidesToScroll () {
    return this.isMobileTwo || this.isTablet ? 1 : this.options.slidesToScroll;
  }

  get slidesVisible () {
    if (this.isTablet) {
      return 3;
    } else {
      return this.isMobile ? 1 : this.isMobileTwo ? 2 : this.options.slidesVisible;
    }
  }
}
