class Animal {
  float x;
  float y;
  int age;
  float speed;
  float size;
  String name;
  String type;
  float dx;
  float dy;
  float fishl;
  float fishw;
  int currentHunger;
  int hungCount; 
  int hungUpdate;
  boolean isAlive;

  Animal(float x, float y, int age, float speed, String name, float size, String type) {
    this.x = x;
    this.y = y;
    this.type = type;
    this.age = age; // for now just a placeholder, will try to implement age/size proportion later
    this.speed = speed;
    this.name = name;
    this.size = size;
    this.dx = random(-1, 1);
    this.dy = random(-1, 1);
    currentHunger = 8;
    hungCount = 0; 
    isAlive = true;
    hungUpdate = 60;
    fishl = size * 2;
    fishw = size;
  }

  void updateHunger() {
    hungCount++;
    println(hungCount);
    if (hungCount >= hungUpdate) {
      currentHunger--;
      hungCount = 0;
    }
    if (currentHunger <= 0) {
      isAlive = false;
    }
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
    
    updateHunger();
  }

   void bounce(){
    if((x + fishw/2) > width || x - fishw/2 < tankX){
      dx *= -1;
    }
    if((y + fishl/2) > height || y - fishl/2 < tankY){
      dy *= -1;
    }
  }

  boolean collidesWith(Animal other) {
        return dist(this.x, this.y, other.x, other.y) < (this.size / 2 + other.size / 2);
    }
  
  boolean canEat(Animal other) {
        return false;
        
  }
  
  void eat() {
        currentHunger += 10;
    }
  
  void display() {
    fill(255,0,0); 
    noStroke();
    circle(x, y, size);
  }
}
