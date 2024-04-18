function imageToVintage(url) {
  const block = $("#vintage-output");
  block.html("<img src='" + url + "' />");
  Caman("#vintage-output img", function() {
    this.greyscale();
    this.contrast(10);
    this.noise(10);
    this.brightness(10);
    this.saturation(56);
    this.render();
  });
}

function imageToSinCity(url) {
  const block = $("#sin-city-output");
  block.html("<img src='" + url + "' />");
  Caman("#sin-city-output img", function() {
    this.greyscale();
    this.contrast(80);
    this.brightness(20);
    this.render();
  });
}

function registerOnImageInputChange() {
  $("#image-input").on("change", function() {
    if (this.files === null || this.files.length <= 0) {
      return;
    }
    const reader = new FileReader();
    reader.onload = function(e) {
      imageToVintage(e.target.result);
      imageToSinCity(e.target.result);
    };
    reader.readAsDataURL(this.files[0]);
  });
}

$(document).ready(function() {
  registerOnImageInputChange();
});
