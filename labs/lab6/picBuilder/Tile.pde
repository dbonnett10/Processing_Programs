class Tile {
  PImage img;
  int x, y;
  int xStart, yStart;
  int oldX, oldY;
  float angle, spinRate;
  boolean building;
  
  Tile(PImage i, int newX, int newY, int beginX, int beginY) {
    img = i;
    x = newX;
    y = newY;
    oldX = beginX;
    oldY = beginY;
    yStart = newY;
    xStart = newX;
    angle = 0;
    spinRate = 4;
    building = false;
  } //Tile (constructor)
  
  void update() {
    angle = (angle + spinRate) % 360;
    
    //*****************How we move the tiles***********************************
    if (building == true) {
      if(x < oldX) {
        x++;
      } //if
      
      else if (x > oldX){
        x--;
      } //else if
      
      else {
        x = x;
      } //else
      
      if(y < oldY) {
        y++;
      } //if
      
      else if (y > oldY) {
        y--;
      } //else if
      
      else {
        y = y;
      } //else
    } //closes the first if statement
    
    if ((oldX == x) && (oldY == y)) {
      building = false;
    } //if
  } //update
  
  void drawTile() {
    pushMatrix();
    translate(x+10, y+10);
    if (building == true) {
      rotate(radians(angle));
    } //if
    translate(-10, -10);
    image(img, 0, 0);
    popMatrix();    
  } //drawTile

} //Tile (class)

