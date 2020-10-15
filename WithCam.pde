void withCam() {
  cam.read();
  if (imageMode != 2) {
    loadPixels();
    cam.loadPixels();
    for (int x = 0; x < 1920; x += inc) {
      for (int y = 0; y < 1080; y += inc) {
        for (int x1 = 0; x1 < inc; x1++) {
          for (int y1 = 0; y1 < inc; y1++) {
            int index = (x + x1) + (y + y1) * width;
            if (pixels[index] == color(0)) {
              pixels[index] = cam.get(x * cam.width/width, y * cam.height/height);
            } else if (imageMode == 3 && green(cam.get(x * cam.width/width, y * cam.height/height)) / 10 == 25) {
            } else {
              continue;
            }
          }
        }
      }
    }
    updatePixels();
  } else {
    img.mask(cam);
    image(img, 0, 0, width, height);
  }
}
