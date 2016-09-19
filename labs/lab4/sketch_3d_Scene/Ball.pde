class Ball{
  int posX, posZ;
  public Ball(int x, int z){
    posX = x;
    posZ = z;
  } //Ball constructor
  void drawBall(){
    pushMatrix();
    translate(posX,-20,posZ);
    fill(255,0,0);
    sphere(20);
    popMatrix();
  } //drawBall
} //Ball
