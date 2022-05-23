public class Gun{
  private float x,y;
  private color c;
  private float rotation = 0;
  public Gun(float x_, float y_, color c_){
    x = x_;
    y = y_;
    c = c_;
  }
  void display(){
    rect(x-5,y-100,10,50);
  }
  
}
