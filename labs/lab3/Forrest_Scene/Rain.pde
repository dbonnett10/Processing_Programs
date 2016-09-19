class Rain {
  float sx, sy;
  float vx;
  float vy;
  float wid, hei;   //gives the rain an x and position, an x and y velocity, a width, a height, and a color
  float colB;
  float colR;
  float colG;
  
    Rain(float x, float y, float w, float h, float c1, float c2, float c3) {
    sx = x;
    sy = y;
    wid = w;
    hei = h;
    vx = 0.2;
    vy = 0.2;
    colR = c1;
    colG = c2;
    colB = c3;
 
} //Rain

//update the postion of the rain
void update() {
   
      sx = sx + vx;
      sy += vy; 

  if (sy > height) {
    sx = random(180, 720);
    sy = random(50,70);

  } //if
  
  vy = random(3,6);   //how fast the rain is falling
    
} //update


//draws the raindrop
void drawRain() {
  fill(colR, colG, colB);
  stroke(colR, colG, colB);
  ellipse(sx, sy, wid, hei);
} //drawRain

} //Rain class
