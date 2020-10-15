void noCam() {
  loadPixels();
  for (int x = 0; x < xres; x++) {
    for (int y = 0; y < yres; y++) {
      int x1 = x * inc;
      int y1 = y * inc;
      int p = pixels[x1 + y1*width];
      if (imageMode != 2) {
        if (p != color(0)) {
          bi.setRGB(x, y, p);
        } else {
          bi.setRGB(x, y, color(255, 255, 255, 0));
        }
      } else {
        bi.setRGB(x, y, color(p, p, p, p));
      }
    }
  }
  try {
    ImageIO.write(bi, "png", src);
  } 
  catch (IOException e) {
    println(e);
  }
}
