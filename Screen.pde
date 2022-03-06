class Screen {
    
    int x, y, w, h;
    String title = "";
    
    Screen(String _title){
        x = originX;
        w = originW;
        if (_title.equals("")){
            y = originY;
            h = originH;
        } else {
            title = _title;
            y = originY + 24;
            h = originH -24;
        }
        
        addScreen(this);
    }
    
    void update() {
    }
    
    void draw(){
        fill(250);
        noStroke();
        textFont(mainFont, 24);
        text(title, originX + 10, originY + 25);
    }

}
