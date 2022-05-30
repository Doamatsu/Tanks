public class Tank {
  private float x, y;
  private color c;
  private PShape gun;
  private String name;
  private float HP;
  private float r;

  public Tank(float x_, float y_, String name_, int HP_) {
    x = x_;
    y = y_;
    name = name_;
    HP = HP_;
    r = .01;
    c = #FF0000;
  }
  public Tank(float x_, float y_, color c_, String name_, int HP_) {
    this(x_, y_, name_, HP_);
    c = c_;
  }
  
  //get Methods
  String getName(){
    return name;
  }
  float getHP() {//gets HP
    return HP;
  }
  color getColor(){
    return c;
  }
  float getRotation(){
    return abs(degrees(r));
  }
  void display() {
    noStroke();
    fill(c);//clears canvas
    pushMatrix();
    translate(x-5, y-26);
    if (current == this) {
      rotate(r);
    }
    rect(0, 0, 35, 5);
    popMatrix();

    rect(x-20, y-25, 40, 25); //creates the tank
    arc(x, y-25, 26, 26, PI, PI+PI); 
    fill(0, 0, 0);
    circle(x, y, 5); //the point the tank is referenced
  }
  void move(String direction) {
    if (direction.equals("right")) {
      x+=2;
    }
    if (direction.equals("left")) {
      x-=2;
    }
  }
}
