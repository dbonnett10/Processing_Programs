float angles[];
float[][] colorvalues;
String[] datavalues;
float total=0;
String message= "Click to see a value";


void setup() {
  background(0);
  size(800, 400);
  noStroke();
 
//Dan
  String[] data = loadStrings("work2.csv");
  angles  = new float[data.length-1];
  datavalues  = new String[data.length-1];
  for (int i=0; i<data.length-1; i++)
  {
    String[] tokens = data[i].split(",");
    angles[i]  = Float.parseFloat(tokens[1]);
    datavalues[i]  = tokens[0];
    //System.out.println(datavalues[i]);
    total= total+angles[i] ;
  }

  for (int i=0; i<data.length-1; i++)
  {
    
    angles[i]  = (angles[i]/total)*390;
  }

  colorvalues  = new float[data.length-1][3];

//Dan
  for (int i = 0; i < data.length-1; i++) {
    float r = random(256);
    float g = random(256);
    float b =random(256);
    r=int(r);
    g=int(g);
    b=int(b);
    
    

    colorvalues[i][0]=r;
    colorvalues[i][1]=g;
    colorvalues[i][2]=b;
  }
}

void draw() {

//Almog
     textSize(24); // SET FONT SIZE
     text(message, 10, 30); // SET POSITION AND WORD
     fill(1,2,3); // SET COLOR
//Dan
  pieChart(300, angles);
  
  
  
  
}
//Almog
void pieChart(float diameter, float[] data) {

  float lastAngle = 0;
  for (int i = 0; i < data.length-1; i++) {
    fill(colorvalues[i][0], colorvalues[i][1], colorvalues[i][2]);
    arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
    lastAngle += radians(angles[i]);
  }
}

//Almog
void mouseClicked() {
   loadPixels(); //Loads the pixel data for the display window into the pixels[] array

 int j = mouseY*width + mouseX;
 //System.out.println("R " + red(pixels[j]) + " G "+green(pixels[j]) +" B "+ blue(pixels[j]) );

   float r = red(pixels[j]);  
   float g = green(pixels[j]); 
   float b = blue(pixels[j]); 


for(int i=0; i<colorvalues.length-1;i++){ 
   float r2 = colorvalues[i][0]; 
   float g2 = colorvalues[i][1]; ; 
   float b2 = colorvalues[i][2]; ; 



     if ((r2==r ) && (g2==g) && (b2== b)){

     message(i);
     }
  
}
}
//Almog
void message(int i){
   
     background(0);
     message =datavalues[i];

     
   
     

}
