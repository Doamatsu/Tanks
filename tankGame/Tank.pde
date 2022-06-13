import java.util.*;
public class Tank {
  private float x, y;
  private color c;
  private String name;
  private float HP;
  private float r;
  public ArrayList<Ammo>Ammos;
  boolean removeAmmo;
  private float rightX, rightY;
  private float leftX, leftY;
  private boolean touchRight = false, touchLeft = false;
  private float stamina;

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
    stamina = 30;

    removeAmmo =false;
  }
  public Tank(float x_, float y_, color c_, String name_, int HP_) {
    this(x_, y_, name_, HP_);
    c = c_;
  }
  //change methods
  void tankFall() {
    y+=5;
  }
  //set Methods
  void setRight(boolean input) {
    touchRight = input;
  }
  void setLeft(boolean input) {
    touchLeft = input;
  }
  //get Methods
  float getStamina() {
    return stamina;
  }
  boolean touchRight() {
    return touchRight;
  }
  boolean touchLeft() {
    return touchLeft;
  }
  float getRightX() {
    return rightX;
  }
  float getRightY() {
    return rightY;
  }
  float getLeftY() {
    return leftY;
  }
  float getLeftX() {
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
    if (debug) {
      fill(#000000);
      text("Ammo: " + Ammos.size(), x, y-60);
      text("Touch Right: " + touchRight(), x, y-100);
      text("Touch Left: " + touchLeft(), x, y-120);
      text(x + " " + y, x, y-80);
    }
    if (current == this) {
      textAlign(LEFT);
      fill(#797979);
      textSize(15);
      text("TURN", x, y-50);
    }
    fill(c);//clears canvas

    pushMatrix();
    translate(x-5, y-26);
    rotate(r);
    rect(0, 0, 36, 10);//gun
    fill(0, 0, 0);
    //circle(36, 3, 5);//point of bullet
    popMatrix();

    fill(c);
    rect(x-20, y-25, 40, 25); //creates the tank

    //vertexes for tank
    rightX = x + 20;
    rightY = y -20;
    leftX = x -20;
    leftY = y -20;
    fill(#000000);
    //circle(rightX, rightY, 5);
    fill(#000000);
    //circle(leftX, leftY, 5);
    //CREATE VARIABLES FOR EDGES FOR DETECTION
    fill(c);
    arc(x, y-25, 26, 26, PI, PI+PI); 
    fill(0, 0, 0);
    //circle(x, y, 5); //the point the tank is referenced
    if(y>height){
      HP = 0;//if fall, die
    }
    if(x+15>=width){
      touchRight=true;
    }
    if(x-15<=0){
      touchLeft = true;
    }
    for (Tank a : Tanks) {
      if (a != this) {
        tankCollision(a);
      }
    }
    if (Ammos.isEmpty()!=true) {//if there's stuff in ammo

      for (Ammo o : Ammos) {
        if (o.ammoTouch()) {
          removeAmmo = true;
          tankGame.next();
          //println("touch map");
        } else {
          for (Tank a : Tanks) {
            if (a != this) {
              if (dist(o.getX(), o.getY(), a.getX(), a.getY()-10) <= 20 ) {//if its close
                a.damage(o.getDamage());
                removeAmmo = true; //remove the ammo after to not get concurrent error
                tankGame.next();
                //println(a.getName());
                //println("touch tank");
              }
            }

            o.display();
          }
        }
        o.display();
      }
      if (removeAmmo) {
        shooting = false;
        removeAmmo = false;
        removeAmmo();
      }
    }
  }
  void tankCollision(Tank otherTank) {// 0 is no 1 is left 2 is right
    if (dist(otherTank.getLeftX(), otherTank.getLeftY(), getRightX(), getRightY()) <=0) {
      //otherTank.getRightX() == getRightX() && otherTank.getRightY() == getRightY()){
      touchRight = true;
    } else if (otherTank.getRightX() == getLeftX() && otherTank.getRightX() == getLeftX()) {
      touchLeft = true;
    }
  }
  void shoot() {
    //println(abs(degrees(r)));
    Ammo ammo = new Ammo(x, y-30, r);
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
  //set methods
  void resetStamina() {
    stamina = 30;
  }
  //remove method
  void decreaseStamina() {
    stamina--;
  }
  void removeAmmo() {
    Ammos.remove(0);
  }
  void damage(float damage) {
    HP-=damage;
  }
}
