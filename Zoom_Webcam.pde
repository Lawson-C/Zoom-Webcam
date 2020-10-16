import processing.video.*;

import javax.imageio.ImageIO;

import java.awt.image.BufferedImage;

File src;
Snow snow;
BufferedImage bi;
Capture cam;

int inc = 40; // must be a factor of 120
int xres = 1920 / inc, yres = 1080 / inc;

int imageMode = 0;
int modeLimit = 2;

PImage img;
PImage backDrop;

boolean isCam = false;

void setup() {
  fullScreen();
  try {
    src = new File(createReader("data_src").readLine()+"\\src.png");
  } 
  catch (IOException e) {
    exit();
  }
  snow = new Snow((int) ((xres * yres) / (inc * 3) * .75));
  bi = new BufferedImage(xres, yres, BufferedImage.TYPE_4BYTE_ABGR);  
  img = loadImage("https://i.kym-cdn.com/photos/images/newsfeed/001/580/125/460.png");
  img.filter(INVERT);
  backDrop = loadImage("2001_virtual_background.jpeg");
  cam = new Capture(this, Capture.list()[0]);
  cam.start();
  cam.read();
  img.resize(cam.width, cam.height);
}

void draw() {
  background(0);
  if (imageMode == 0) {
    image(loadImage("https://i.kym-cdn.com/photos/images/newsfeed/001/580/125/460.png"), 0, 0, 1920, 1080);
  } else if (imageMode == 1) {
    snow.periodic();
  } else if (imageMode == 2) {
    image(img, 0, 0, 1920, 1080);
  }
  if (isCam) {
    if (cam.available()) {
      withCam();
    } else {
      isCam = false;
    }
  } else {
    noCam();
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    imageMode++;
    if (imageMode > modeLimit) {
      imageMode = 0;
    }
  } else if (mouseButton == RIGHT) {
    isCam = !isCam;
  }
}
