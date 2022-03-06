class Game extends Screen {
    
    InteractableSquare[] gameSelector;
    
    Game() {
        super("");
    }
    
    void update() {
    }
    
    void draw() {
        super.draw();
        noStroke();
        fill(255, 0, 0);
        rect(x+10, y+10, w-20, h-20);
    }
}
