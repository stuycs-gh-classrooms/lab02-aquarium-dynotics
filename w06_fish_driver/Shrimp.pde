class Shrimp extends Animal {
  
boolean moveDir = true; 
    int moveCount = 0; 
    int moveIndicator = 60; 

    Shrimp(float x, float y, int age, float speed, String name, float size, String type) {
        super(x, y, age, speed, name, size, "Shrimp");
        this.y = tankY + tankH - floorH - size; 
    }
    
    boolean canEat(Animal other) {
      // shrimp can eat all other animals but goldfish- scavengers (but goldfish meat is gross)
        return !"Goldfish".equals(other.type);
    }
    

    void move(int tankW, int tankH, int tankX, int tankY, int floorH) {
      
        moveCount++;
        
        if (moveCount >= moveIndicator) {
            moveDir = !moveDir; 
            moveCount = 0; 
        }

        if (moveDir) {
            x += speed;
        } else {
            x -= speed;
        }

        if (x < tankX + size/2) {
            x = tankX + size/2;
            moveDir = true; 
        }
        if (x > tankX + tankW - size/2) {
            x = tankX + tankW - size/2;
            moveDir = false;
        }
    }
    
    void display() 
    {
    fill(255, 185, 195); 
    circle(x,y,size);
  }
}
