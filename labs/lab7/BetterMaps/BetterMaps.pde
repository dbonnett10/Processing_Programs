PImage img;  //declare an image

void setup() {  
  colorMode(HSB, 360, 100, 100);   //change to HSB color mode
  img = loadImage("map.png");       //load the image
  size(img.width, img.height);      //set the size
  image(img, 0, 0);                 //draw the image with top left corner at origin
  noStroke();   
  loadPixels();                     //load pixels
 
 
  for (int i=0; i<pixels.length;i++){   //loop through all pixels
   float h = hue(pixels[i]);  
   float s = saturation(pixels[i]); 
   float b = brightness(pixels[i]); 
 
//***************THE WATER********************\\
     if (((hue(pixels[i]) < 217) && (hue(pixels[i]) > 209)) && ((saturation(pixels[i]) < 42) && (saturation(pixels[i]) > 29)) && ((brightness(pixels[i]) < 101) && (brightness(pixels[i]) > 99))) {
    pixels[i]=color(h, s, b-30); 
    } //Water
    
//***************PARKS (large green areas)************************\\
         if (((hue(pixels[i]) < 90) && (hue(pixels[i]) > 79)) && ((saturation(pixels[i]) < 26) && (saturation(pixels[i]) > 19)) && ((brightness(pixels[i]) < 90) && (brightness(pixels[i]) > 85))) {
    pixels[i]=color(h+60, s+60 ,b); //parks
    } //Park
    
    
//**************WHAT I'M ASSUMING ARE LITTLE BODIES OF WATER******\\
         if (((hue(pixels[i]) < 90) && (hue(pixels[i]) > 79)) && ((saturation(pixels[i]) < 26) && (saturation(pixels[i]) > 19)) && ((brightness(pixels[i]) < 90) && (brightness(pixels[i]) > 85))) {
    pixels[i]=color(h+60, s, b); 
    } //SMALLER WATER
    
//**************WHAT I THINK ARE THE UNIVERSITIES*****************\\
   if (((hue(pixels[i]) < 48) && (hue(pixels[i]) > 40)) && ((saturation(pixels[i]) < 23) && (saturation(pixels[i]) > 17)) && ((brightness(pixels[i]) < 92) && (brightness(pixels[i]) > 87))) {
    pixels[i]=color(h, s+50, b-3); 
    } //ALL OF THE SCHOOLS
    
//**************THE INTERSTATE***********************************\\
        if (((hue(pixels[i]) < 47) && (hue(pixels[i]) > 30)) && ((saturation(pixels[i]) < 100) && (saturation(pixels[i]) > 50)) && ((brightness(pixels[i]) < 109) && (brightness(pixels[i]) > 89))) {
    pixels[i]=color(h, s, b+30);
   } //INTERSTATE
    
//*************BACKGROUND****************************************\\
      if (((hue(pixels[i]) < 43) && (hue(pixels[i]) > 38)) && ((saturation(pixels[i]) < 8) && (saturation(pixels[i]) > 0)) && ((brightness(pixels[i]) < 100) && (brightness(pixels[i]) > 88))) {
    pixels[i]=color(h-1, s-6, b + 1); 
    } //BACKGROUND


//**************HOSPITALS (I THINK)****************************\\
      if (((hue(pixels[i]) < 8) && (hue(pixels[i]) > 4)) && ((saturation(pixels[i]) < 12) && (saturation(pixels[i]) > 8)) && ((brightness(pixels[i]) < 95) && (brightness(pixels[i]) > 89))) {
        pixels[i]=color(h, s+35, b-1); 
    } //HOSPITALS
    
//*************ORIGINALLY YELLOW ROADS*************************\\
     if (((hue(pixels[i]) < 49) && (hue(pixels[i]) > 45)) && ((saturation(pixels[i]) < 61) && (saturation(pixels[i]) > 58)) && ((brightness(pixels[i]) < 102) && (brightness(pixels[i]) > 96))) {
        pixels[i]=color(h, s-35, b + 12); 
     } //YELLOW ROADS
     
//************ORIGINALLY WHITE ROADS***************************\\
     if (((hue(pixels[i]) < 1) && (hue(pixels[i]) > -1)) && ((saturation(pixels[i]) < 1) && (saturation(pixels[i]) > -1)) && ((brightness(pixels[i]) < 94) && (brightness(pixels[i]) > 90))) {
        pixels[i]=color(h+2, s, b); 
     } //WHITE ROADS  
     
//***********ORIGINALLY GRAY ROADS****************************\\
    if (((hue(pixels[i]) < 1) && (hue(pixels[i]) > -1)) && ((saturation(pixels[i]) < 1) && (saturation(pixels[i]) > -1)) && ((brightness(pixels[i]) < 55) && (brightness(pixels[i]) > 45))) {
        pixels[i]=color(h+10, s, b - 12); 
     } //GRAY ROADS
 
    } //for
  
  updatePixels(); 
} //for



void draw(){
  //only need to have a draw function so that the mousePressed function works
}

void mouseClicked() {
   loadPixels();

 int pos = mouseY*width + mouseX;
 System.out.println("hue " + hue(pixels[pos]) + " Sat "+saturation(pixels[pos]) +" Bright "+ brightness(pixels[pos]) );
}


