class Rain {
  float sx, sy, sz;
  float vx;
  float vy;
  float wid, hei;   //gives the rain an x and position, an x and y velocity, a width, a height, and a color
  float colB;
  float colR;
  float colG;
  
    Rain() {
    sx = random(-1250, 1200);
    sy = random(-1500, 0);
    sz = random(-5000, -2500);
    wid = 4;
    hei = 20;
    vx = 0.2;
    vy = 0.2;
    colR = 44;
    colG = 123;
    colB = 245;
 
} //Rain

//update the postion of the rain
void update() {
   
      sx = sx + vx;
      sy += vy; 

  if (sy > 400) {
    sx = random(-1250, 1200);
    sy = random(-1500, 0);
    sz = random(-5000, -2500);

  } //if
  
  vy = random(22, 30);   //how fast the rain is falling
    
} //update


//draws the raindrop
void drawRain() {
  pushMatrix();
  translate(sx, sy, sz);
  fill(colR, colG, colB);
  //stroke(colR, colG, colB);
  sphere(1);
  popMatrix();
} //drawRain

} //Rain class
