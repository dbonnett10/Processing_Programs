
class House {
  float wid, hei, dep;
  float x, y, z;
  int r, g, b;
  
  public House(float h, float w, float d) {
    wid = w;
    hei = h;
    dep = d;
    
  } //house (constructor)
  
  void drawHouse() {
    //roof part of the house (a rotated box)
    pushMatrix();
    translate(0, -hei/2, 0);
    rotateZ(radians(45));
    fill(54,18,8);
    box((wid/sqrt(2)), (wid/sqrt(2)), dep-2); 
    noStroke();
     popMatrix();
     
    //the actual house
    pushMatrix();
    translate(x, y, z);
    fill(131, 125, 123);
    box(wid, hei, dep);
    popMatrix();
    
    //the door
    pushMatrix();
    translate(-50, 70, (dep/2) + 1);
    fill(229, 159, 28);
    noStroke();
    rect(x, y, 100, 165);
    translate(80, 82, 1);
    fill(0);
    ellipse(x, y, 10, 10);
    popMatrix(); 
    
    //window to the left of the door
    pushMatrix();
    translate(-200, 70, (dep/2)+1);
    fill(255, 255, 255);
    rect(x, y, 100, 100);
    popMatrix();
    
    //window to the right of the door
    pushMatrix();
    translate(100, 70, (dep/2)+1);
    fill(255, 255, 255);
    rect(x, y, 100, 100);
    popMatrix();
    
    //upper windows
    pushMatrix();
    translate(-200, -200, (dep/2)+1);
    rect(x, y, 100, 120);
    translate(300, 0, 0);
    rect(x, y, 100, 120);
    popMatrix();
     
  } //drawHouse
  
} //house (class)
