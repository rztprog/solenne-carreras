export class Carousel {
  constructor (element, options = {}){
    this.element = element;
    this.options = Object.assign({}, {
      slidesToScroll: 1,
      slidesVisible: 1
    }, options);
    let children = [].slice.call(element.children);

    this.isMobile = false;
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
      this.container.appendChild(item);
      return item;
    })

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
  }

  onWindowResize () {
    let mobile = window.innerWidth < 1000;
    let tablet = window.innerWidth < 1600 && window.innerWidth > 1000;

    if (tablet !== this.isTablet) {
      this.isTablet = tablet;
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
    let prevButton = this.createDivWithClass("carousel-prev carouse-button");
    let nextButton = this.createDivWithClass("carousel-next carouse-button");

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

  gotoItem (index, previewPress){
    if (index < 0) {
      index = this.items.length - this.slidesVisible;
    } else if (index >= this.items.length || this.items[this.currentItem + this.slidesVisible] === undefined)  {
      previewPress ? index : index = 0;
    }
    let translateX = index * -100 / this.items.length;
    this.container.style.transform = `translate3D(${translateX}%, 0, 0)`;
    this.currentItem = index;
  }

  get slidesToScroll () {
    return this.isMobile || this.isTablet ? 1 : this.options.slidesToScroll;
  }

  get slidesVisible () {
    if (this.isTablet) {
      return 2;
    } else {
      return this.isMobile ? 1 : this.options.slidesVisible;
    }
  }
}
