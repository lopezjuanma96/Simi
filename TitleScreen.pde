class TitleScreen extends Screen {
    
    InteractableSquare[] gameSelector;
    
    TitleScreen() {
        super("Bienvenidos a Simi! Elige tu Juego");
        
        gameSelector = new InteractableSquare[1];
        gameSelector[0] = new InteractableSquare(x + 100, y+100, 200, 200, 2, "altoJuego");
        gameSelector[0].activateListener();
    }
    
    void update() {
        if(gameSelector[0].isInteracting()){
            ScreenIndex = 1;
            println("yes!");
        }
    }
    
    void draw() {
        super.draw();
        gameSelector[0].draw();
    }
}
