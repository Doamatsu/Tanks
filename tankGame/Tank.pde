public class Tank{
  float x,y;
  color c;
  PShape gun;
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
    noStroke();
    fill(c);//clears canvas
    pushMatrix();
    translate(x-5,y-58);
    rotate(r);
    rect(0,0,70,10);
    popMatrix();
    
    rect(x-40,y-50,80,50); //creates the tank
    arc(x,y-50,40,40,PI,PI+PI); 
    fill(0,0,0);
    circle(x,y,5); //the point the tank is referenced
  }
  void move(String direction){
    if(direction.equals("right")){
      x+=2;
    }
    if(direction.equals("left")){
      x-=2;
    }
  }
}
