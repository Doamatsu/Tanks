public class StandardTank extends Tank{
  Ammo ammo;
  public StandardTank(float x_, float y_, color c_, String name_, int HP_){
    super(x_,y_,c_,name_,50);
    ammo = new StandardBullet();
  }
  
  void shoot(Ammo ammo){
    ammo.getDamage();
  }
}