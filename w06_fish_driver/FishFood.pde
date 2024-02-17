class FishFood {
    float x;
    float y;
    float size;
    boolean isFalling;
    float tankH; 
    float floorH;

    FishFood(float x, float y) {
        this.x = x;
        this.y = y;
        size = 10;
        isFalling = true;
        this.tankH = height - 50;
        this.floorH = 0;
    }

        void update() {
        if (isFalling) {
            y += 1; 
            if (y >= tankH - floorH - size / 2) 
            {
                y = tankH - floorH - size / 2; 
                isFalling = false;
            }
        }
    }
    
    boolean isEaten(Animal animal) {
        float distance = dist(this.x, this.y, animal.x, animal.y);
        return distance < this.size / 2 + animal.size / 2;
    }
    
    void display() {
        fill(95, 55, 0);
        noStroke();
        circle(x, y, size);
    }
}
