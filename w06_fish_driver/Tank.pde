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
        Animal animal = animals.get(i);
        animal.move(w, h, x, y, floorH);
    }
  }

  void addAnimal(Animal animal) {
    animals.add(animal);
  }
  
  void updateAnimals() {
    ArrayList<Animal> toRemove = new ArrayList<Animal>();

    for (int i = 0; i < animals.size(); i++) {
        Animal predator = animals.get(i);
        for (int j = 0; j < animals.size(); j++) {
            if (i != j) {
                Animal prey = animals.get(j);

                if (predator.collidesWith(prey) && predator.canEat(prey)) {
                    toRemove.add(prey);
                    predator.eat();
                }
            }
        }
    }
    
    animals.removeAll(toRemove);
    
    for (int i = 0; i < animals.size(); i++) {
        Animal animal = animals.get(i);
              animal.updateHunger();
    }
    
        ArrayList<FishFood> eatenFood = new ArrayList<FishFood>();

    for (int i = 0; i < animals.size(); i++) {
        Animal animal = animals.get(i);
        for (int j = 0; j < foods.size(); j++) {
            FishFood food = foods.get(j);
            if (food.isEaten(animal)) {
                animal.currentHunger += 5;
                eatenFood.add(food);
            }
        }
        animal.updateHunger();
    }

    foods.removeAll(eatenFood);
    
  }

void removeDeadAnimals() {
    for (int i = animals.size() - 1; i >= 0; i--) {
        Animal animal = animals.get(i);
        if (!animal.isAlive && !"BettaFish".equals(animal.type)) {
            animals.remove(i);
        }
    }
  }
}
