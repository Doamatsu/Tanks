import java.util.*;
public class Map {
  private boolean[][]map; //size is 800 x 800
  int SQUARESIZE = width/16;
  public Map() {
    map = new boolean[width/20][height/20];
    //println(map.length);
    for (int i = 0; i<map.length; i++) {
      for (int j = 0; j<map.length; j++) {
        map[i][j] = false; //sets everything to space for now
      }
    }
    for (int i = 0; i<map.length; i++) {
      for (int j = 30; j<map.length; j++) {
        map[i][j] = true;
      }
    }
  }
  void display() {
    for (int i = 0; i<map.length; i++) {
      for (int j = 0; j<map.length; j++) {
        if (map[i][j] == true) {

          //println("i " + i + " j " + j);
          stroke(1);
          fill(#00FF00);
          square(i*20, j*20, 20);
        }
      }
    }
  }
  boolean ammoTouch(float ammoX, float ammoY) {
    for (int i = 0; i<map.length; i++) {
      for (int j = 0; j<map.length; j++) {
        //print(map[i][j]);
        if (map[i][j] == true && dist(ammoX, ammoY, i*20, j*20) <=10) {
          //println(true);
          map[i][j] = false;
          return true;
        }
      }
    }
    return false;
  }
  boolean touchY(Tank tank) {//returns true if touching bottom of tank
    for (int i = 0; i<map.length; i++) {
      for (int j = 0; j<map.length; j++) {
        //print(map[i][j]);
        if (map[i][j] == true && dist(0, tank.getY(), 0, j*20) <=0 && dist(tank.getX(), 0, i*20, 0) <=10 ) {
          
          //println(i + " " + j);
          return true;
        }
      }
    }
    return false;
  }
  boolean touchX(Tank tank) {
    for (int i = 0; i<map.length; i++) {
      for (int j = 0; j<map.length; j++) {
        if (map[i][j] == true && ((tank.getRightX() == i*20 && tank.getRightY() == j*20))
        || (tank.getLeftX() == i*20 && tank.getLeftY() == j *20)){
          println(((tank.getRightX() == i*20 && tank.getRightY() == j*20))
        || (tank.getLeftX() == i*20 && tank.getLeftY() == j *20));
          return true;
        }
      }
    }
    return false;
  }

  //remove methods
  void remove(int x_, int y_) {
    map[x_][y_] = false;
  }
}
