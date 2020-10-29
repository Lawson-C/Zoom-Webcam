void withCam() {
  cam.read();
  if (imageMode == 1) {
    loadPixels();
    for (int x = 0; x < screenSizeX; x += inc) {
      for (int y = 0; y < screenSizeY; y += inc) {
        int i = x + y*screenSizeX;
        if (pixels[i] == color(0)) {
          noStroke();
          fill(cam.get(x * cam.width/screenSizeX, y * cam.height/screenSizeY));
          rect(x, y, inc, inc);
        }
      }
    }
  } else if (imageMode == 2) {
    img.mask(cam);
    image(img, 0, 0, width, height);
  }
}
