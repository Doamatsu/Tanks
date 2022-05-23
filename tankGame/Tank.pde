public class Tank{
  float x,y;
  color c;
  PShape gun;
  public Tank(float x_,float y_){
    x = x_;
    y = y_;
    c = #FF0000;
    gun = createShape(RECT,x-5,y-100,10,50);//gun
    gun.setFill(c);
  }
  public Tank(float x_, float y_, color c_){
    this(x_,y_);
    c = c_;
    gun.setFill(c);
  }
  void display(){
    fill(c);//clears canvas
    shape(gun);
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
    if(direction.equals("gun right")){
      gun.translate(gun.width/2, gun.height/2);
      gun.rotate(rotation);
      gun.translate(gun.width/2, gun.height/2);
    }
    if(direction.equals("gun left")){
      gun.translate(gun.width/2, gun.height/2);
      gun.rotate(-1*rotation);
      gun.translate(gun.width/2, gun.height/2);
    }
  }
}
