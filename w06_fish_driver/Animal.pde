class Animal {
  float x;
  float y;
  int age;
  float speed;
  float size;
  String name;
  float dx;
  float dy;
  float fishl = size * 2;
  float fishw = size;

  Animal(float x, float y, int age, float speed, String name, float size) {
    this.x = x;
    this.y = y;
    this.age = age; // for now just a placeholder, will try to implement age/size proportion later
    this.speed = speed;
    this.name = name;
    this.size = size;
    this.dx = random(-1, 1);
    this.dy = random(-1, 1);
  }

  void move(int tankW, int tankH, int tankX, int tankY, int floorH) {
    if (frameCount % 60 == 0) { // direction change
      dx = random(-1, 1);
      dy = random(-1, 1);
    }

    x += dx * speed;
    y += dy * speed;

    if (x <= tankX || x >= tankX + tankW - size) {
      dx = -dx; 
      x += dx * speed; 
    }

    if (y <= tankY || y >= tankY + tankH - floorH - size) {
      dy = -dy; 
      y += dy * speed; 
    }
  }

   void bounce(){
    if((x + fishw/2) > width || x - fishw/2 < tankX){
      fishvx *= -1;
    }
    if((y + fishl/2) > height || y - fishl/2 < tankY){
      fishvy *= -1;
    }
  }

  void display() {
    fill(255,0,0); 
    noStroke();
    circle(x, y, size);
  }
}
  
