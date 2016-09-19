//****************************
// Dan Bonnett and Izaak Miller
//CMPSCI 382 Lab3
//Draws the static picture
//modified the lab1 scene to the lab 3 requirments
//added a rotating windmill type thing and when the mouse 
//is pressed the blade will rotate faster, the pond and the
//moon are scaled by 2, and the moon is moved to just
//above the road
//****************************

int i = 0;
int j = 0;
boolean isRotating = false;
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
  pushMatrix();
  fill(108, 68, 25);
  stroke(108, 68, 25);
  translate(0, 240);
  rect(0, 0, 720, 240);
  popMatrix();
  
  //first tree to the left
  pushMatrix();
  translate(50, 380);
  fill(121,24,24);
  rect(0, 0, 20, 80);
  popMatrix();
  fill(26, 160, 10);
  stroke(26, 160, 10);
  pushMatrix();
  translate(15, 380);
  triangle(0, 0, 45, -40, 90, 0);
  translate(3, -22);
  triangle(0, 0, 42, -58, 84, 0);
  translate(4, -22);
  triangle(0, 0, 38, -61, 77, 0);
  popMatrix();
  
  
    //the road. Has been translated
  pushMatrix();
  fill(103,81,81);
  stroke(103,81,81);
  translate(170, 240);
  rect(0, 0, 70, 240);
  popMatrix();
  
  
  //road lines. Have been translated
  pushMatrix();
  fill(214, 205, 19);
  translate(206, 240);
  rect(0, 0, 4, 240);
  translate(-6, 0);
  rect(0, 0, 4, 240);
  popMatrix();
  
  
  //the pond. Has been translated
  pushMatrix();
  fill(25, 189, 209);
  stroke(25, 189, 209);
  translate(550, 350);
  if (isRotating) {
    scale(3);
  } //if
  ellipse(0, 0, 300, 200);
  popMatrix();
  pushMatrix();
  translate(450, 410);
  rect(0, 0, 200, 410);  
  popMatrix();
  
 
 //2nd tree to the left. Has been translated
  fill(121, 24, 24);
  stroke(121, 24, 24);
  pushMatrix();
  translate(120, 300);
  rect(0, 0, 20, 60);
  popMatrix();
  pushMatrix();  
  fill(26, 160, 10);
  stroke(26, 160, 10);
  translate(100, 300);
  triangle(0, 0, 30, -20, 60, 0);
  translate(4, -10);
  triangle(0, 0, 26, -20, 51, 0);
  translate(4, -8); 
  triangle(0, 0, 22, -22, 42, 0);
  popMatrix();
  
  
  //the sky. Doesnt need translated
  fill(13, 86, 95);
  rect(0,0,720,240);
  stroke(13, 86, 95);
  
  
  //the clouds. Have been translated
  pushMatrix();
  fill(101, 110, 111);
  stroke(101, 110, 111);
  translate(600, 30);
  ellipse(0, 0, 350, 200);
  translate(-290, 10);
  ellipse(0, 0, 350, 210);
  translate(390, -10);
  ellipse(0, 0, 300, 300);
  popMatrix();
  
  
  //the moon. Has been translated
  pushMatrix();
  fill(225, 231, 232);
  translate(70, 40);
  if (isRotating) {
    scale(2);
    translate(70, 60);
  }
  ellipse(0, 0, 70, 70);
  popMatrix();
  
  
  
  //3rd tree to the left. Has been translated
  pushMatrix();
  fill(121, 24, 24);
  stroke(121, 24, 24);
  translate(280, 350);
  rect(0, 0, 40, 120);
  popMatrix();
  pushMatrix();
  fill(26, 160, 10);
  stroke(26, 160, 10);
  translate(250, 350);
  triangle(0, 0, 50, -40, 100, 0); 
  translate(5, -20);
  triangle(0, 0, 45, -60, 90, 0);
  translate(5, -20);
  triangle(0, 0, 40, -60, 80, 0);
  popMatrix();
  
  
  
  //the rain
  for (int j = 0; j < 400; j++) {
    allRain.get(j).drawRain();
    allRain.get(j).update();
     } //for
  
  
   //windmill
  pushMatrix();
  translate(100, 240);
  fill(252,252,252);
  triangle(0, 0, 5.5, -70, 10, 0);
  translate(6, -72);
  rotate(radians(i));
  translate(-3, -21);
  fill(252,252,252);
  if (isRotating) {
    i += 10;
  }
  rect(0, 0, 6, 44);
  popMatrix();
  i++;
  
  pushMatrix();
  translate(106,168);
  fill(252);
  rotate(radians(j));
  translate(-23, -2);
  if (isRotating) {
    j += 10;
  } //if
  rect(0, 0, 44, 6);
  popMatrix();
  j++;
  
    if (mousePressed) {
    background(255);
  } //if
 
  
} //draw

void mousePressed() {
  isRotating =! isRotating;
} //mousePressed
