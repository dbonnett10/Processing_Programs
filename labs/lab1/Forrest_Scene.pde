//****************************
// Dan Bonnett
//CMPSCI 382 Lab 1
//Draws the static picture
//****************************


final float vy = .02;
ArrayList<Rain> allRain = new ArrayList<Rain>();


void setup() {
  size(720, 480);
  background(255, 252, 252);
  
  for (int i = 0; i < 400; i++) {
    allRain.add(new Rain(random(180, 720), random(50, 480), 2, 10, 72, 122, 245));
    
  } //for
  
} //setup

void draw() {
  //the ground
  fill(108, 68, 25);
  stroke(108, 68, 25);
  rect(0, 240, 720, 240);
  
  //first tree to the left
  fill(121,24,24);
  rect(50, 380, 20, 80);
  fill(26, 160, 10);
  stroke(26, 160, 10);
  triangle(15, 380, 60, 340, 105, 380);
  triangle(18, 358, 60, 300, 102, 358);
  triangle(22, 336, 60, 275, 98, 336);

  //the pond
  fill(25, 189, 209);
  stroke(25, 189, 209);
  ellipse(550, 350, 300, 200);
  rect(450, 410, 200, 410);  
 
 //2nd tree to the left
  fill(121, 24, 24);
  stroke(121, 24, 24);
  rect(120, 300, 20, 60);   
  fill(26, 160, 10);
  stroke(26, 160, 10);
  triangle(100, 300, 130, 280, 160, 300);
  triangle(104, 290, 130, 270, 155, 290);
  triangle(108, 282, 130, 260, 150, 282);
  
  //the sky
  fill(13, 86, 95);
  rect(0,0,720,240);
  stroke(13, 86, 95);
  
  //the clouds
  fill(101, 110, 111);
  stroke(101, 110, 111);
  ellipse(600, 30, 350, 200);
  ellipse(310, 40, 350, 210);
  ellipse(700, 30, 300, 300);
  
  //the moon
  fill(225, 231, 232);
  ellipse(70, 40, 70, 70);
  
  //3rd tree to the left
  fill(121, 24, 24);
  stroke(121, 24, 24);
  rect(280, 350, 40, 120);
  fill(26, 160, 10);
  stroke(26, 160, 10);
  triangle(250, 350, 300, 310, 350, 350); 
  triangle(255, 330, 300, 270, 345, 330);
  triangle(260, 310, 300, 250, 340, 310);
  
  //the road
  fill(103,81,81);
  stroke(103,81,81);
  rect(170,240, 70, 240);
  
  //road lines
  fill(214, 205, 19);
  rect(206, 240, 4, 240);
  rect(200, 240, 4, 240);
  
  //the rain
  for (int j = 0; j < 400; j++) {
    allRain.get(j).drawRain();
    allRain.get(j).update();
    
  } //for
  
} //draw
