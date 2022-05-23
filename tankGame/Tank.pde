public class Tank{
  float x,y;
  color c;
  
  public Tank(float x_,float y_){
    x = x_;
    y = y_;
    c = #FF0000;
  }
  public Tank(float x_, float y_, color c_){
    this(x_,y_);
    c = c_;
  }
  void display(){
    fill(c);
    rect(x-40,y-50,80,50);
    arc(x,y-50,40,40,PI,PI+PI);
    fill(0,0,0);
    circle(x,y,5);
  }
  void move(String direction){
    if(direction.equals("right")){
      x+=2;
    }else if(direction.equals("left")){
      x-=2;
    }
  }
}
