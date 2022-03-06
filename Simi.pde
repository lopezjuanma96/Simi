import processing.core.PSurfaceNone;

color backgroundColor;
PFont mainFont;
int originX, originY, originW, originH;
int winW, winH;

int ScreenIndex = 0;
Screen[] ScreenList;
TitleScreen titleScreen;
Game gameScreen;

Interactable[] interactableList;
InteractableSquare closeButton, backButton;

void setup() {
    winW = displayWidth;
    winH = displayHeight;
    originX = (int)(0.02*winW);
    originY = (int)(0.02*winH);
    originW = (int)(0.96*winW);
    originH = (int)(0.96*winH);
    fullScreen();
    backgroundColor = color(2, 6, 33);
    mainFont = createFont("aAhaWow.otf", 64);
    
    interactableList = new Interactable[0];
    backButton = new InteractableSquare(winW-75, 0, 70, 50, 3, "back");
    closeButton = new InteractableSquare(winW-55, 0, 50, 50, 3, "x");
    
    ScreenList = new Screen[0];
    titleScreen = new TitleScreen();
    gameScreen = new Game();
}

void update() {
  
    ScreenList[ScreenIndex].update();
    
    if (closeButton.isInteracting()){
        println("closing");
        exit();
    }
    if (backButton.isInteracting()){
        println("going back");
        ScreenIndex = 0;
    }
}

void draw() {
    update();
    background(backgroundColor);
    stroke(250);
    noFill();
    rect(originX, originY, originW, originH);
    circle(mouseX, mouseY, max(10, width/20));
    drawScreens();
    
}

void drawScreens(){
    ScreenList[ScreenIndex].draw();
    if (ScreenIndex == 0) {
        closeButton.activateListener();
        backButton.deactivateListener();
        closeButton.draw();
    } else {
        backButton.activateListener();
        closeButton.deactivateListener();
        backButton.draw();
    }
}
        

void mouseClicked() {
    for (int i=0; i<interactableList.length; i++){
        interactableList[i].mouseClicked();
    }
}

void addInteractable(Interactable value) {
    Interactable[] aux = new Interactable[interactableList.length+1];
    for (int i=0; i<interactableList.length; i++){
        aux[i] = interactableList[i];
    }
    aux[interactableList.length] = value;
    interactableList = aux;
}

void addScreen(Screen value) {
    Screen[] aux = new Screen[ScreenList.length+1];
    for (int i=0; i<ScreenList.length; i++){
        aux[i] = ScreenList[i];
    }
    aux[ScreenList.length] = value;
    ScreenList = aux;
}
