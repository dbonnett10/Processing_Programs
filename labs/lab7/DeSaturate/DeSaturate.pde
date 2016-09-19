PImage img, img2;  //declare 2 images

void setup() {
  img = loadImage("chart.png");    //load the original image, which will be the top image
  img2 = loadImage("chart.png");   //load the second image, which will be the desaturated image  
  size(img.width, img.height*2);   //declare the size
  colorMode(HSB, 360, 100, 100);   //set the color mode along with hue, saturation, and brightness values
  noStroke();                      //no stroke
  
  image(img2, 0, img.height);      //draw img2 at the bottom half of the screen
  
  loadPixels();                    //load the pixels
  
  for (int i = 0; i < pixels.length; i++) {    //loop through all the pixels
    float h = hue(pixels[i]);                  //the hue for each pixel
    float s = saturation(pixels[i]);          //the saturation for each pixel
    float b = brightness(pixels[i]);          //the brightness for each pixel
      
    pixels[i] = color(h, s-40, b);            //set the color to have the same hue and brightness values, but decrease the hue by 40
   } //for
  
 updatePixels();                      //update the pixels
 
 image(img, 0, 0);                    //draw the original image at the top of the screen
} //setup
