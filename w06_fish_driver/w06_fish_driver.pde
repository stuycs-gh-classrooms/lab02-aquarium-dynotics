// driver file - when i checked this morning, for some reason all of my code had been deleted...?

Tank t;
int tankX = 0;
int tankY = 50;
int floorH = 100;
int tankW;
int tankH;
ArrayList<FishFood> foods = new ArrayList<FishFood>();

void setup() {
  size(600, 600);
  tankW = width;
  tankH = height - 50;
  t = new Tank(tankX, tankY, tankW, tankH, floorH);
  t.display();
}//setup

void draw() {
  background(150);
  t.moveAnimals();
  t.display();
  t.updateAnimals();
  t.removeDeadAnimals();
  
  for (int i = 0; i < foods.size(); i++) {
    FishFood food = foods.get(i);
    food.update();
    food.display();
  }
}

void keyPressed() {
    Animal animal = null; 

    if (key == '1') {
        animal = new BettaFish(mouseX, mouseY, 1, 2, "Betta", 20, "");
    } else if (key == '2') {
        animal = new Shrimp(mouseX, mouseY, 1, 1, "Shrimp", 15, "");
    } else if (key == '3') {
        animal = new Goldfish(mouseX, mouseY, 1, 1.5, "Goldie", 20, "");
    } else if (key == '4') {
        animal = new Crab(mouseX, mouseY, 1, 1, "Crabby", 15, "");
    }

    if (animal != null) {
        t.addAnimal(animal); 
    }
}

void mousePressed() {
  FishFood newFood = new FishFood(mouseX, mouseY);
  foods.add(newFood);
}
