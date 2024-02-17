class Goldfish extends Animal {  

  Goldfish(float x, float y, int age, float speed, String name, float size, String type) {
      super(x, y, age, speed, name, size, "Goldfish");
  }  
  
  boolean canEat(Animal other) {
        return "Shrimp".equals(other.type); 
    } 

  void display() {  
    fill(255, 165, 0);  
    ellipse(x, y, fishw, fishl);  
  }  

  void bounce() {  
    super.bounce();
    if ((y + fishl/2) > height - floorH) {  
      dy *= -1;  
    }  
  }    
}
