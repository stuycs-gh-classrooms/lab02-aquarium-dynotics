// jack's

class Goldfish extends Animal{
  
  Goldfish(){
    super(mouseX, mouseY, tankW, tankH);
  }
  
  void display(){
    fill(255, 165, 0);
    ellipse(fishx, fishy, fishw, fishl);
  }
  
  void bounce(){
    super.bounce();
    if((fishy + fishl/2) > height - floorH){
      fishvy *= -1;
    }
  }  
}
