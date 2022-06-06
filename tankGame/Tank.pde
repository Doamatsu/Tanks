import java.util.*;
public class Tank {
  private float x, y;
  private color c;
  private String name;
  private float HP;
  private float r;
  public ArrayList<Ammo>Ammos;
  private float ammoX, ammoY;
  boolean removeAmmo;
  private float rightX, rightY;
  private float leftX, leftY;
  private boolean touchRight = false, touchLeft = false;

  public Tank(float x_, float y_, String name_, int HP_) {
    x = x_;
    y = y_;
    rightX = x_ + 20;
    rightY = y_ -20;
    leftX = x_ -20;
    leftY = y_ -20;
    name = name_;
    HP = HP_;
    r = .01;
    c = #FF0000;
    Ammos = new ArrayList<Ammo>();
    ammoX = x+30;
    ammoY = y-23;
    removeAmmo =false;
  }
  public Tank(float x_, float y_, color c_, String name_, int HP_) {
    this(x_, y_, name_, HP_);
    c = c_;
  }
  //change methods
  void tankFall(){
    y+=5;
  }
  //set Methods
  void setRight(boolean input){
    touchRight = input;
  }
  void setLeft(boolean input){
    touchLeft = input;
  }
  //get Methods
  boolean touchRight(){
    return touchRight;
  }
  boolean touchLeft(){
    return touchLeft;
  }
  float getRightX(){
    return rightX;
  }
  float getRightY(){
    return rightY;
  }
  float getLeftY(){
    return leftY;
  }
  float getLeftX(){
    return leftX;
  }
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  String getName() {
    return name;
  }
  float getHP() {//gets HP
    return HP;
  }
  color getColor() {
    return c;
  }
  float getRotation() {
    //return r;
    return round(abs(degrees(r)));
  }
  void display() {
    noStroke();
    text("Touch Right: " + touchRight(),x,y-100);
    text("Touch Left: " + touchLeft(),x,y-120);
    text(x + " " + y,x,y-80);
    if(current == this){
      fill(0,0,0);
      text("TURN", x,y-50);
    }
    fill(c);//clears canvas
    
    pushMatrix();
    translate(x-5, y-26);
    if (current == this) {
      rotate(r);
    }
    rect(0, 0, 36, 10);//gun
    fill(0, 0, 0);
    circle(36, 3, 5);//point of bullet
    popMatrix();
      
    ammoX = x + (36*cos(getRotation()));
    ammoY = y - 24- (36*sin(getRotation()));

    fill(c);
    rect(x-20, y-25, 40, 25); //creates the tank

    //vertexes for tank
    rightX = x + 20;
    rightY = y -20;
    leftX = x -20;
    leftY = y -20;
    fill(#000000);
    circle(rightX,rightY,5);
    fill(#000000);
    circle(leftX,leftY,5);
    //CREATE VARIABLES FOR EDGES FOR DETECTION
    fill(c);
    arc(x, y-25, 26, 26, PI, PI+PI); 
    fill(0, 0, 0);
    for(int i = 0;i<=1;i++){
      fill(i*2,0,0);
      circle(x + abs(36*cos(i)),y - 24- abs(36*sin(i)),5);
    }
    circle(x, y, 5); //the point the tank is referenced

    if (Ammos.isEmpty()!=true) {//if there's stuff in ammo
      for (Ammo o : Ammos) {
        for (Tank a : Tanks) {
          if (a != this) {
            if (dist(o.getX(), o.getY(), a.getX(), a.getY()) <= 20 ) {//if its close
              a.damage(o.getDamage());
              removeAmmo = true; //remove the ammo after to not get concurrent error
              //println("CLOSE");
            }else if(o.ammoTouch()){
            removeAmmo = true;
          }
        }
        //println("displaying");
        //println(Tanks.get(1).getX() + " " + Tanks.get(1).getY());
        //println(dist(o.getX(), o.getY(), Tanks4.get(1).getX(), Tanks.get(1).getY()));

        o.display();
      }
    }
    if (removeAmmo) {
      removeAmmo = false;
      removeAmmo();
    }
    }
  }

  void shoot() {
    println((36*cos(getRotation())) + " " + (36*sin(getRotation())));
    Ammo ammo = new Ammo(ammoX, ammoY, r);
    Ammos.add(ammo);
  }
  void move(String direction) {
    if (direction.equals("right")) {
      x+=2;
    }
    if (direction.equals("left")) {
      x-=2;
    }
  }
  //remove method
  void removeAmmo() {
    Ammos.remove(0);
  }
  void damage(float damage) {
    HP-=damage;
  }
}
