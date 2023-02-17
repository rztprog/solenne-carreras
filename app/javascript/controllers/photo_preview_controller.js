import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    // console.log("photo previews connected");
  }

  preview() {
    this.clearPreviews();
  
    for (let i = 0; i < this.targets.element.files.length; i++) {
      let file = this.targets.element.files[i];
      const reader = new FileReader()
      this.createAndDisplayFilePreviewElements(file, reader);
    }
  }

  createAndDisplayFilePreviewElements(file, reader) {
    reader.onload = () => {
      let element = this.contructPreviews(file, reader);
      element.src = reader.result;
      element.setAttribute("href", reader.result);
      element.setAttribute("target", "_blank");
      element.classList.add("photo-preview");

      document.getElementById("photo-previews").appendChild(element);
    };

    reader.readAsDataURL(file);
  }

  contructPreviews(file, reader) {
    let element;
    let cancelFunction = (e) => this.removePreview(e);
    switch (file.type) {
      case "image/jpeg":
      case "image/png":
        element = this.createImageElement(cancelFunction, reader);
        break;
    }

    element.dataset.filename = file.name;
    return element;
  }

  createImageElement(cancelFunction, reader){
    let cancelUploadButton, cancelUploadButtonIcon, element;
    const image = document.createElement("img");
    image.setAttribute("style", "background-image: url(" + reader.result + ")");
    image.classList.add("preview-photo")

    element = document.createElement("div");
    
    // If is not content_photos its photographie_photo
    if (document.getElementById("content_photos") == null) {
      element.classList.add("photographie-image-container", "file-removal");
    } else {
      element.classList.add("photo-image-container", "file-removal");
    }

    element.appendChild(image);

    cancelUploadButton = document.createElement("div");

    if (document.getElementById("photographie_photo") != null) {
      cancelUploadButton.classList.add("cancel-upload-button-photographie");
    } else {
      cancelUploadButton.classList.add("cancel-upload-button");
    }

    cancelUploadButtonIcon = document.createElement("i");
    cancelUploadButtonIcon.classList.add("fa-solid", "fa-circle-xmark");

    cancelUploadButton.appendChild(cancelUploadButtonIcon);

    cancelUploadButton.onclick = cancelFunction;
    element.appendChild(cancelUploadButton);
    return element;
  }

  clearPreviews() {
    document.getElementById("photo-previews").innerHTML = "";
    document.getElementById("photo-previews").setAttribute("style", "display: inline");
  }

  removePreview(event) {
    const target = event.target.parentNode.closest(".photo-preview");
    const dataTransfer = new DataTransfer();
    let fileInput = document.getElementById("content_photos");

    // If is not content_photos its photographie_photo
    if (fileInput == null) {
      fileInput = document.getElementById("photographie_photo");
    }

    let files = fileInput.files;
    let filesArray = Array.from(files);

    filesArray = filesArray.filter((file) => {
      let filename = target.dataset.filename;
      return file.name !== filename;
    });

    target.parentNode.removeChild(target);
    filesArray.forEach((file) => dataTransfer.items.add(file));
    fileInput.files = dataTransfer.files;
  }
}
