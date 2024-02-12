class BettaFish extends Animal {
  float angle = 0; // angular direction
  float turnSpeed = 0.05; 
  float dartSpeed = 4; 
  boolean isDarting = false;
  int dartCount = 0; // frames between darts
  int coolDown = 120;

  BettaFish(float x, float y, int age, float speed, String name, float size) {
    super(x, y, age, speed, name, size);
  }
  
  void display() {
    if (isDarting) {
      fill(255, 0, 0); 
    } else {
      fill(25, 150, 255);
    }
    square(x, y, size * 2);
  }
  
  void startDart() {
    if (!isDarting && random(1) < 0.25) {
      isDarting = true;
      dartCount = (int)random(25, 50);
      angle += PI;
    }

    if (isDarting) {
      if (dartCount > 0) {
        dx = cos(angle) * dartSpeed;
        dy = sin(angle) * dartSpeed;
        dartCount--;
      } 
      else 
      {
        isDarting = false;
        coolDown = (int)random(50, 200);
      }
    } 
    
    else 
    {
       if (random(1) > 0.5) {
            angle += turnSpeed;
        } else {
            angle -= turnSpeed; 
        } 
        
      dx = cos(angle) * speed;
      dy = sin(angle) * speed;
      
      if (--coolDown <= 0) 
      {
        angle += PI;
      }
    }
  }

  void move(int tankW, int tankH, int tankX, int tankY, int floorH) {
    startDart();

    x += dx;
    y += dy;

    if (x < tankX + size/2 || x > tankX + tankW - size/2) {
      angle += PI;
    }
    if (y < tankY + size/2 || y > tankY + tankH - floorH - size/2) {
      angle += PI; 
    }

    if (x <= tankX || x >= tankX + tankW - size) {
      dx = -dx; 
      x += dx * speed; 
    }

    if (y <= tankY || y >= tankY + tankH - floorH - size) {
      dy = -dy; 
      y += dy * speed; 
    }
  }
  
}
