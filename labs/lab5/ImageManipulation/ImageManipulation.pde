PImage img, img2, img3, img4;
int counter = 0;
float myFilter[][][] = 
{
  //MyFilter (this filter is on the bottom left image)   
  {{-3/2, -1., -3/2},    
   {-10., 19/2., 19/2.},
   {-11/3, -1., -11/3}}};
   
   
float filter[][][] =
{
    //This is the sharpen 2 filter from the convolution program  (this filter should be on the bottom right image)
    //The filter looks different in this program then it does in the convolution program so I tried to modify it a little
   {{-1,  -1,  -1},
    {-3/2, 10, -3/2},
    {-3/2,  -1,  -3/2}}};
   
   

void setup() {
  //load all the images
  img = loadImage("warMachine2.png");  
  img2 = loadImage("warMachine2.png");
  img3 = loadImage("warMachine2.png");
  img4 = loadImage("warMachine2.png");
  
  size(500, 648);    //set the size
  
  image(img, 0, 0);  //draw the regular image
  image(img2, img.width, 0);  //draw the second image
  
  loadPixels();
  
  int size = 2*(img.width * img.height);
 
 //image 2 filter
  for (int i = 0; i < pixels.length; i++) {
    if (((i % (2*img.width)) >= img.width) && (i <= size)) {
      color c = pixels[i];
      float colorRed = red(c);
      float colorGreen = green(c);
      float colorBlue = blue(c);
      pixels[i] = color(150-colorRed, 200-colorGreen, 255-colorBlue);    
     } //if
  } //for
  
  updatePixels();
  applyFilter();
  counter++;
} //setup


void applyFilter() {
  for (int y = 0; y < img.height; y++ ) {
    for (int x = 0; x < img.width; x++) {
      img4.pixels[y*img.width+x] = convolution(x, y, myFilter[(counter%myFilter.length)], img);
    } //inner for
  } //outer for
  img4.updatePixels();
  //counter++;
  for (int y = 0; y < img.height; y++) {
     for (int x=0; x<img.width; x++) {
        img3.pixels[y*img.width+x] = convolution(x, y, filter[counter%filter.length], img);
    } //for
  } //for
  img3.updatePixels();
  image(img3, 0, height/2);
  image(img4, width/2, height/2);
  counter++;
} //applyFilter

 
 
// calculates the color after applying the filter
color convolution(int x, int y, float[][] matrix, PImage img) {
  int offset = floor(matrix.length/2);
  float r = 0.0, g = 0.0, b = 0.0;

  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
      // Which neighbor are we using
      int newX = x+i-offset;
      int newY = y+j-offset;
      int idx = img.width * newY + newX;
      // Make sure we haven't walked off our image
      idx = constrain(idx, 0, img.pixels.length-1);
      // Calculate the convolution
      r += (red(img.pixels[idx]) * matrix[i][j]);
      g += (green(img.pixels[idx]) * matrix[i][j]);
      b += (blue(img.pixels[idx]) * matrix[i][j]);
    } // for
  } // for
  if (counter%myFilter.length == myFilter.length-1) { 
    return color(r+127, g+127, b+127);  
  } //if
  else if (counter%filter.length == filter.length-1) {
    return color (r+127, g+127, b+127);
  } //else if
  else {
    return color(r, g, b);
  } //else
} //convolution
 