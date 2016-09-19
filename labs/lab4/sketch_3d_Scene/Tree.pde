class Tree {
  float wid, hei, dep;
  float x, y, z;
  
  public Tree(float h, float w, float d) {
    wid = w;
    hei = h;
    dep = d;
    
  } //tree constructor
  
  void drawTree() {
    pushMatrix();
    translate(x, y, z);
    fill(80, 55, 17);
    box(wid, hei, dep);
    popMatrix();
    
    pushMatrix();
    translate(x, -hei+200, z);
    fill(119, 224, 104);
    sphere(200);
    translate(-50, -50, 50);
    sphere(200);
    translate(0, 0, -100);
    sphere(200);
    translate(100, 0, 0);
    sphere(200);
    translate(0, 0, 100);
    sphere(200);
    translate(-50, -75, -50);
    sphere(200);
    popMatrix();
    
  } //drawTree
  
  
} //tree
