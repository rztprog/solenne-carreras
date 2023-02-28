import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slider"];
  
  connect() {
    /*find all elements with an "overlay" class:*/
    let imgCompOverlay = document.querySelectorAll(".img-comp-overlay");

    for (let i = 0; i < imgCompOverlay.length; i++) {
      /*once for each "overlay" element:
      pass the "overlay" element as a parameter when executing the compareImages function:*/
      compareImages(imgCompOverlay[i]);
    }

    function compareImages(img) {
      let clicked = 0;
      const slider = document.createElement("div");
      
      /*get the width and height of the img element*/
      let width = img.offsetWidth;
      let height = img.offsetHeight;
    
      /*set the width of the img element to 50%:*/
      img.style.width = (width / 2) + "px";

      /*create slider:*/
      slider.setAttribute("class", "img-comp-slider");
      /*insert slider*/
      img.parentElement.insertBefore(slider, img);
      /*position the slider in the middle:*/
      slider.style.top = (height / 2) - (slider.offsetHeight / 2) + "px";
      slider.style.left = (width / 2) - (slider.offsetWidth / 2) + "px";

      /*execute a function when the mouse button is pressed:*/
      slider.addEventListener("mousedown", slideReady);
      /*and another function when the mouse button is released:*/
      window.addEventListener("mouseup", slideFinish);

      /*or touched (for touch screens:*/
      slider.addEventListener("touchstart", slideReady);
      /*and released (for touch screens:*/
      window.addEventListener("touchend", slideFinish);

      function slideReady(e) {
        /*prevent any other actions that may occur when moving over the image:*/
        // e.preventDefault();
        /*the slider is now clicked and ready to move:*/
        clicked = 1;
        /*execute a function when the slider is moved:*/
        window.addEventListener("mousemove", slideMove);
        window.addEventListener("touchmove", slideMove);
      }

      function slideFinish() {
        /*the slider is no longer clicked:*/
        clicked = 0;
      }

      function slideMove(e) {
        let pos;
        /*if the slider is no longer clicked, exit this function:*/
        if (clicked == 0) return false;
        /*get the cursor's x position:*/
        pos = getCursorPos(e);
        /*prevent the slider from being positioned outside the image:*/
        if (pos < 0) pos = 0;
        if (pos > width) pos = width;
        /*execute a function that will resize the overlay image according to the cursor:*/
        slide(pos);
      }

      function getCursorPos(event) {
        event = (event.changedTouches) ? event.changedTouches[0] : event;
        /*get the x positions of the image:*/
        let aCoord = img.getBoundingClientRect();
        /*calculate the cursor's x coordinate, relative to the image:*/
        let cursorX = event.pageX - aCoord.left;
        /*consider any page scrolling:*/
        cursorX = cursorX - window.pageXOffset;
        return cursorX;
      }

      function slide(x) {
        /*resize the image:*/
        img.style.width = x + "px";
        /*position the slider:*/
        slider.style.left = img.offsetWidth - (slider.offsetWidth / 2) + "px";
      }
    }
  }
}
