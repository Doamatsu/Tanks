public class Ammo {
  private float damage;
  private float x, y;
  private float ry;

  public Ammo(float x_, float y_) {
    x = x_;
    y = y_;
    damage = 10;
  }

  float getDamage() {
    return damage;
  }
  boolean isClose(Tank tank){
    if(tank.
  }
  void display() {
    
    if (shooting) {
      fill(0, 0, 0);
      circle(x, y, 10);
      if (y<=200) {
        ry *= -1;
        y-=ry;
      } else {
        y-=ry;
      }
      x+=10;
    }
  }
}
