int camX, camY, camZ;
float lookX, lookY, lookZ;
float angle, angleV;
int posX, posZ;
int placeX = (int) random(-2500, 2500);
int placeZ = (int) random(-2500, 2500);
int count = 0;
House house1;
House house2;
House house3;
House house4;
House house5;
House house6;
House house7;

Tree tree1;
Ball ball;

//used for the lights
boolean isAmbient = false;
boolean isPointLight = false;
boolean isDirectional = false;
boolean gotBall = false;
boolean isRaining = false;

PImage img;


ArrayList<Rain> allRain = new ArrayList<Rain>();
ArrayList<Tree> trees = new ArrayList<Tree>();

void setup() {
  size (1000, 800, P3D);
  
  //creating the houses
  house1 = new House(500, 500, 350);
  house2 = new House(500, 500, 350);
  house3 = new House(500, 500, 350);
  house4 = new House(500, 500, 350);
  house5 = new House(500, 500, 350);
  house6 = new House(500, 500, 350);
  house7 = new House(500, 500, 350);
  
  tree1 = new Tree(500, 100, 100);
  ball = new Ball(placeX, placeZ);

  //earth image
  img = loadImage("earth.gif");

  
  //creating the rain
  for (int i = 0; i < 1000; i++) {
    allRain.add(new Rain());
  } //for
  
  
  camX = 0;
  camY = 0;
  camZ = -3000;
  lookX = 0;
  lookY = 0;
  lookZ = -100000;
  angle = 0;
  angleV = 0;
  
 
} //setup

void draw() {
  background(0);
  fill(255);
  

  //earth image
  pushMatrix();
  translate(2000, -3000, -8000);
  image(img, 0, 0);
  popMatrix();
  
    pushMatrix();
    translate(0, 100, -5000);
    ball.drawBall();
    popMatrix();
  
   if (distance(placeX,placeZ,camX,camZ)) {
     gotBall = true;
     ball.posX = (int) random(-2500, 2500);
     ball.posZ = (int) random(-2500, 2500);
     placeX = ball.posX;
     placeZ = ball.posZ;
     count++;
     System.out.println("Number of times you have found the ball: " + count); 
     
   } //if
   else{
     gotBall = false;
   }
  
  
  //press q for the ambient lighting
   if (isAmbient) {
    ambientLight(216, 11, 38);
  } //if
  
  
  //press w for the point lighting coming from the moon
  if (isPointLight) {
    pointLight(126, 129, 134, -500, -2000, -3000);
    //turn on the rain
    for (int j = 0; j < 1000; j++) {
    allRain.get(j).drawRain();
    allRain.get(j).update();
    } //for
  } //if
  
  
  //press e for the directional lighting
  if (isDirectional) {
   directionalLight(0, 0, 255, 0, -1, -200); 
    //turn on the rain
    for (int j = 0; j < 1000; j++) {
    allRain.get(j).drawRain();
    allRain.get(j).update();
    } //for
     } //if
  
 
  //the ground
  pushMatrix();
  translate(0, 100, -5000);
  fill(25, 59, 7);
  box(5000, 2, 5000);
  popMatrix();
  

  //trees
  pushMatrix();
  translate(-1500, -150, -2800);
  tree1.drawTree();
  translate(200, 0, 0);
  tree1.drawTree();
  translate(-400, 0, 0);
  tree1.drawTree();
  translate(-200, 0 ,0);
  tree1.drawTree();
  translate(-200, 0, 0);
  tree1.drawTree();
  translate(-200, 0, 0);
  tree1.drawTree();
  
  for(int k = 0; k < 3; k++) {
    translate(0, 0, -1500);
    tree1.drawTree();
  }
  
  for (int g = 0; g < 3; g++) {
    translate(1500, 0, 0);
    tree1.drawTree();
  }
  
  for (int l = 0; l < 3; l++) {
    translate(0, 0, 1500);
    tree1.drawTree();
  }
  
  for (int s= 0; s < 3; s++) {
    translate(-600, 0, 0);
    tree1.drawTree();
  }
  popMatrix();
  //end of trees
  
  
  
  //house1
  pushMatrix();
  translate(-1500,-130,-3500);
  rotateY(radians(90));
  house1.drawHouse();
  popMatrix();
  
  
  //house2
  pushMatrix();
  translate(-1500, -130, -4500);
  rotateY(radians(90));
  house2.drawHouse();
  popMatrix();
  
  
  //house3
  pushMatrix();
  translate(-1500, -130, -5500);
  rotateY(radians(90));
  house3.drawHouse();
  popMatrix();
  
  
  //house4
  pushMatrix();
  translate(-400, -130, -6500);
  house4.drawHouse();
  popMatrix();
  
  
  //house5
  pushMatrix();
  translate(600, -130, -6500);
  house5.drawHouse();
  popMatrix();
  
  
  //house6
  pushMatrix();
  translate(1700, -130, -5500);
  rotateY(radians(-90));
  house6.drawHouse();
  popMatrix();
  
  
  //house7
  pushMatrix();
  translate(1700, -130, -3500);
  rotateY(radians(-90));
  house7.drawHouse();
  popMatrix();
  
  
  //the moon
  pushMatrix(); 
  translate(-2000, -5000, -7000);
  fill(219, 217, 203);
  sphere(1000);
  popMatrix();
 
 keyboardInput();
 mousePosition();
 camera(camX, camY, camZ, lookX, lookY, lookZ, 0, 1, 0);
  
} //draw



//movement
void keyboardInput() {
  if (keyPressed && (key == CODED)) {
    switch (keyCode) {
      case LEFT:
        camX += 20*sin(radians(angle-90));
        camZ += -20*cos(radians(angle-90));
        break;
        
      case RIGHT:
        camX += -20*sin(radians(angle-90));
        camZ += 20*cos(radians(angle-90));
        break;
        
      case UP:
        camX += 20*sin(radians(angle));
        camZ += -20*cos(radians(angle));
        break;
        
      case DOWN:
        camX += -20*sin(radians(angle));
        camZ += 20*cos(radians(angle));
        break;
        
        
      default:
        break;        
      
    } //switch
  } //if
  
} //keyboardInput



void mousePosition() {
  float mouse = mouseX;
  float mou = mouseY;
  float wid = width;
  float hei = height;
  angle = ((mouse/wid)-0.5)*360;
  angleV = ((mou/hei)-0.5)*180;
  updateCameraPointing();
} //mousePosition



void updateCameraPointing() {
  lookX = 100000*sin(radians(angle));
  lookY = 100000*sin(radians(angleV));
  lookZ = -100000*cos(radians(angle));
} //updateCameraPointing



void keyPressed() {
  //for the ambient lighting
  if (keyPressed && (key == 'q') || gotBall == true) {
    isDirectional = false;
    isPointLight = false;
    isRaining = false;
    isAmbient =! isAmbient;
  } //if

  //for the point light from the moon
  if (keyPressed && (key == 'w')) {
    isAmbient = false;
    isDirectional = false;
    isPointLight =! isPointLight;
    isRaining =! isRaining;
  } //if
  
  //for the spot lighting
  if(keyPressed && (key == 'e')) {
    isPointLight = false;
    isAmbient = false;
    isDirectional =! isDirectional;
    isRaining =! isRaining;
  } //if
} //keyPressed


boolean distance(int placeX, int placeZ, int camX, int camZ){
  int pX = placeX;
  int pZ = placeZ - 5000;
  int cX = camX;
  int cZ = camZ;
 float dist = sqrt( pow(pX-cX,2) + pow(pZ-cZ,2));
    if (dist < 100) {
        return true;
    }
    else{
    return false;
    }
} //distance





