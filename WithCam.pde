void withCam() {
  cam.read();
  if (imageMode == 1) {
    loadPixels();
    for (int x = 0; x < screenSizeX; x += inc) {
      for (int y = 0; y < screenSizeY; y += inc) {
        int i = x + y*screenSizeX;
        if (pixels[i] == color(0)) {
          noStroke();
          fill(cam.get(cUnitsX(x), cUnitsY(y)));
          rect(x, y, inc, inc);
        }
      }
    }
  } else if (imageMode == 2) {
    img.mask(cam);
    image(img, 0, 0, width, height);
  } else if (imageMode == 3) {
    for (int x = 0; x < cam.width; x += cUnitsX(inc)) {
      for (int y = 0; y < cam.height; y += cUnitsY(inc)) {
        if (green(cam.get(x, y)) <= 255 && green(cam.get(x, y)) >= 100 &&
          red(cam.get(x, y)) <= 255 && red(cam.get(x, y)) >= 205 && 
          blue(cam.get(x, y)) <= 255 && blue(cam.get(x, y)) >= 100) {
          noStroke();
          fill(backDrop.get(x * backDrop.width/cam.width, y * backDrop.height/cam.height));
          rect(sUnitsX(x), sUnitsY(y), inc, inc);
        }
      }
    }
  }
}
