public class Ammo {
  private float damage;
  private float x, y;
  private float ry,rx;
  private float r;
  private float gravity = .01;
  public Ammo(float x_, float y_,float radius) {
    x = x_;
    y = y_;
    r = radius;
    rx = cos(r) * 2;
    damage = 10;
    ry = sin(r)*2;
    
  }

  float getDamage() {
    return damage;
  }
  boolean ammoTouch(){
    return map.ammoTouch(x,y);
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
    ry+= gravity;
  }
  //get methods
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
}
