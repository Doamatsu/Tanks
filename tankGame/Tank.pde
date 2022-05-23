public class Tank{
  float x, y;
  color c;
  public Tank(float x_, float y_){
    x = x_;
    y = y_;
    c = #FF0000;
  }
  void display(){
    fill(c);
    rect(x-20,y-25,40,25);
    arc(x,y-25,20,20,PI,PI+PI);
    fill(0,0,0);
    circle(100,100,5);
  }
}
