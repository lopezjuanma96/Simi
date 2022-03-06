class Interactable {
    
    int x, y, w, h;
    int interactionType; //this will define how you interact with the object
    //0: not interactable
    //1: hoverable
    //2: presseable (only requires mouse press)
    //3: clickeable (requires mouse click - press and release)
    int duration; //this sets a timer in millis to define how long the interaction is required to stay for
    boolean wasClicked, listenerActive;
    
    Interactable(int _x, int _y, int _w, int _h, int _interaction, int _duration){
        setup(_x, _y, _w, _h, _interaction, _duration);
    }
    
    Interactable(int _x, int _y, int _w, int _h, int _interaction){
        setup(_x, _y, _w, _h, _interaction, 0);
    }
    
    void setup(int _x, int _y, int _w, int _h, int _interaction, int _duration){
        x = _x;
        y = _y;
        w = _w;
        h = _h;
        
        interactionType = _interaction;
        
        if(_duration > 0){
            //set timer to duration
        }
        
        addInteractable(this);
    }
    
    boolean isMouseHere(){
        return (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h); 
    }
    
    boolean isInteracting(){
        if (listenerActive) {
            switch(interactionType){
                case 1:
                    return isMouseHere();
                case 2:
                    return isMouseHere() && mousePressed;
                case 3:
                    if(wasClicked){
                        wasClicked = false;
                        return true;
                    } else {
                        return false;
                    }
                default:
                    return false;
            }
        } else {
            return false;
        }
    }
    
    void draw() {
      
    }
    
    void mouseClicked(){
        wasClicked = isMouseHere() && listenerActive;
    }
    
    void activateListener() { listenerActive = true; }
    void deactivateListener() {listenerActive = false; }
}

class InteractableSquare extends Interactable {
    
    String text;
    int textSize;
    
    InteractableSquare(int _x, int _y, int _w, int _h, int _interaction, int _duration, String _text){
        super(_x, _y, _w, _h, _interaction, _duration);
        text = _text;
        textSize = h/3;
    }
    
    InteractableSquare(int _x, int _y, int _w, int _h, int _interaction, String _text){
        super(_x, _y, _w, _h, _interaction);
        text = _text;
        textSize = h/3;
    }
    
    void draw(){
         noStroke();
         fill(250);
         rect(x, y, w, h);
         fill(backgroundColor);
         textSize(textSize);
         text(text, x + w/2 - textWidth(text)/2, y + h/2 + textSize/4);
    }
}
