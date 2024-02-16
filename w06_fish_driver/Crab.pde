// demir's
class Crab extends Animal{

  ArrayList<Animal> animals = new ArrayList<Animal>();

  Crab(float x, float y, int age, float speed, String name, float size) 
  {
    super(x, y, age, speed, name, size);
  }

  void display(){
    fill(255, 0, 0);
    ellipse(x, y, fishw, fishl);
  }

  void bounce(){
    if((y + fishl/2) > height || y - fishl/2 < height - floorH){
      dx *= -1;
    }
    if((x + fishw/2) > width || x - fishw/2 < tankX){
      dx *= -1;
    }
    for(int i = 0; i < animals.size(); i++) {
      Animal ani = animals.get(i);
      if(dist(this.x, this.y, ani.x, ani.y) < 20 && this.x != ani.x && this.y != ani.y){
        dy *= -1;
        dx *= -1;
      }
    }
  }
}
