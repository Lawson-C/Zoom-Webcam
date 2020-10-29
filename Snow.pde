class Snow {
  ArrayList<SnowFlake> particles = new ArrayList();
  HashMap<Integer, HashMap<Integer, Boolean>> flakes;

  Snow(int amount) {
    this.flakes = new HashMap<Integer, HashMap<Integer, Boolean>>();
    for (int i = 0; i < amount; i++) {
      int s = inc;
      int area = s * 9;
      int x = i * area + s;
      if (x > screenSizeX) {
        //x -= screenSizeX;
      }
      int y = (int) random(s, screenSizeY - 2*s);
      try {
        while (this.flakes.get(x / area).get(y / area)) {
          y = (int) random(s, screenSizeY - s*2);
        }
      } 
      catch (NullPointerException e) {
        try {
          this.flakes.get(x / area).put(y / area, true);
        } 
        catch (NullPointerException e2) {
          this.flakes.put(x / area, new HashMap<Integer, Boolean>());
        }
      }
      this.flakes.get(x / area).put(y / area, true);
      this.particles.add(new SnowFlake(x, y, inc, s));
    }
  }

  void periodic() {
    for (SnowFlake s : this.particles) {
      s.periodic();
    }
  }
}

class SnowFlake {
  int x, y;
  int move;
  int size;

  SnowFlake(int x, int y, int move, int size) {
    this.x = x;
    this.y = y;
    this.move = move;
    this.size = size;
  }

  void periodic() {
    this.move();
    this.display();
  }

  void move() {
    this.y += this.move;
    if (this.y >= screenSizeY) {
      this.y = 0;
    }
  }

  void display() {
    noStroke();
    fill(255);
    rect(this.x - this.size, this.y - this.size, 
      this.size, this.size);
    rect(this.x + this.size, this.y - this.size, 
      this.size, this.size);
    rect(this.x, this.y, 
      this.size, this.size);
    rect(this.x - this.size, this.y + this.size, 
      this.size, this.size);
    rect(this.x + this.size, this.y + this.size, 
      this.size, this.size);
  }
}
