public class Ammo {
  private float damage;
  private float x, y;
  private float ry,rx;
  private float r;
  public Ammo(float x_, float y_,float radius) {
    x = x_;
    y = y_;
    r = abs(degrees(radius));
    rx = 10;
    damage = 10;
    ry = (tan(radius))*10;
    if (r>90) {
      println("true");
        ry *= -1;
        rx*= -1;
      }
    println("ry: " + ry);
  }

  float getDamage() {
    return damage;
  }

  void display() {

    if (shooting) {
      fill(0, 0, 0);
      circle(x, y, 10);
      //  y+=ry;
      //} else {
        y+=ry;
      //}
      x+=rx;
    }
  }
  //get methods
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
}
