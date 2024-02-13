// demir's
class Goldfish extends Animal{
  
  Goldfish(float x, float y, int age, float speed, String name, float size) {
    super(x, y, age, speed, name, size);
  }
  
  void display(){
    fill(255, 165, 0);
    ellipse(x, y, fishw, fishl);
  }
  
  void bounce(){
    super.bounce();
    if((y + fishl/2) > height - floorH){
      dy *= -1;
    }
  }  
}
