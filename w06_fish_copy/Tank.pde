class Tank {
  int x;
  int y;
  int w;
  int h; 
  int floorH;
  
  ArrayList<Animal> animals;

  Tank(int x, int y, int w, int h, int floorH) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.floorH = floorH;
    animals = new ArrayList<Animal>();
  }

  void display() {
    fill(0, 255, 255);
    noStroke();
    
    rect(x, y, w, h - floorH);
    fill(210, 180, 140);
    rect(x, y + (h - floorH), w, floorH);

    for (int i = 0; i < animals.size(); i++) {
      animals.get(i).display();
    }
  }
  
  void moveAnimals() {
    for (int i = 0; i < animals.size(); i++) {
      animals.get(i).move(w, h, x, y, floorH);
    }
  }

  void addAnimal(float mx, float my) {
  if (my < y + h - floorH) {
      animals.add(new BettaFish(mx, my, 1, 2, "Fishy", 20));
    } 
    else 
    {
      animals.add(new Shrimp(mx, my, 1, 1, "Shrimpy", 15));
    }
  }
}
