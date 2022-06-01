public class Tank {
  private float x, y;
  private color c;
  private String name;
  private float HP;
  private float r;
  public ArrayList<Ammo>Ammos;
  private float ammoX, ammoY;
  boolean removeAmmo;

  public Tank(float x_, float y_, String name_, int HP_) {
    x = x_;
    y = y_;
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

  //get Methods
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
    return abs(degrees(r));
  }
  void display() {
    noStroke();
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
    rect(0, 0, 35, 10);
    fill(0, 0, 0);
    circle(35, 3, 5);//point of bullet
    ammoX = 35+screenX(0, 0);
    ammoY = 3 + screenY(0, 0);
    popMatrix();

    fill(c);
    rect(x-20, y-25, 40, 25); //creates the tank
    arc(x, y-25, 26, 26, PI, PI+PI); 
    fill(0, 0, 0);
    //circle(x, y, 5); //the point the tank is referenced

    if (Ammos.isEmpty()!=true) {//if there's stuff in ammo
      for (Ammo o : Ammos) {
        for (Tank a : Tanks) {
          if (a != this) {
            if (dist(o.getX(), o.getY(), a.getX(), a.getY()) <= 50) {//if its close
              a.damage(o.getDamage());
              removeAmmo = true; //remove the ammo after to not get concurrent error
              //println("CLOSE");
            }
          }
        }
        //println("displaying");
        //println(Tanks.get(1).getX() + " " + Tanks.get(1).getY());
        //println(dist(o.getX(), o.getY(), Tanks.get(1).getX(), Tanks.get(1).getY()));

        o.display();
      }
    }
    if (removeAmmo) {
      removeAmmo = false;
      removeAmmo();
    }
    
  }

  void shoot() {
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
