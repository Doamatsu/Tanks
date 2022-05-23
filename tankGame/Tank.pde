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
}
