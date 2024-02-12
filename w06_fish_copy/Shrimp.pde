class Shrimp extends Animal { // will probably change to snail later

  Shrimp(float x, float y, int age, float speed, String name, float size) {
    super(x, y, age, speed, name, size);
    this.y = tankY + tankH - floorH - size * 2;
  }

    void display() {
    fill(255, 185, 195); 
    circle(x,y,size);
  }
  
  void move(int tankW, int tankH, int tankX, int tankY, int floorH) {
    dx = random(-1, 1);

    x += dx * speed;

    if (x < tankX + size/2) {
      x = tankX + size/2;
    }
    if (x > tankX + tankW - size/2) {
      x = tankX + tankW - size/2; 
    }
  }
}
