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
    //rect(x-20,y-25,40,25);
    //arc(x-10,y+25,20,10,);
    fill(0,0,0);
    circle(100,100,5);
  }
}