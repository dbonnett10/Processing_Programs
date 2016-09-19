PImage img;
Tile[] tiles;
boolean isBuilding = false;

void setup() {
  img = loadImage("sky.jpg");    //load the image
  size(img.width, img.height);    //set the size
  tiles = new Tile[288];          //create a new array of tiles
  
  int tileNum = 0;           //initialize tileNum to zero
  
  //**************Create the tiles, giving them a random x and y position****************************
  for (int y = 0; y < img.height; y += 20) {    
    for (int x = 0; x < img.width; x += 20) {
      tiles[tileNum] = new Tile(img.get(x, y, 20, 20), (int)random(img.width), (int)random(img.height), x, y);
      tileNum++;
    } //for   
  } //for
  
} //setup

void draw() {
  background(0);
  if (isBuilding) {
  for(int tileChoice=0; tileChoice<288; tileChoice++){
    if (tiles[tileChoice].y == tiles[tileChoice].yStart && tiles[tileChoice].x == tiles[tileChoice].xStart ) {
      tiles[tileChoice].building = true;
    } //if
  } //for
} //if isBuilding 
  
  
  for (int i = 0; i < tiles.length; i++) {
    tiles[i].update();
    tiles[i].drawTile();
  } //for
} //draw
  
  
void mousePressed() {
  isBuilding =! isBuilding;    //if the mouse is pressed, isBuilding will be true
} //mousePressed

