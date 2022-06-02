import java.util.*;
public class Map {
  private boolean[][]map; //size is 800 x 800
  int SQUARESIZE = width/16;
  public Map() {
    map = new boolean[width/20][height/20];
    println(map.length);
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
  //boolean touchX(float tankX, float tankY){//if touching on sides left right
  //  for (int i = 0; i<map.length; i++) {
  //    for (int j = 0; j<map.length; j++) {
  //      if (map[i][j] == true && dist(tankX,0,i*20,0) <= 0) {
  //        return true;
  //      }
  //    }
  //  }
  //  return false;
  //}
  boolean touchY(float tankY) {
    for (int i = 0; i<map.length; i++) {
      for (int j = 0; j<map.length; j++) {
        print(map[i][j]);
        if (map[i][j] == true && dist(0, tankY, 0, j*20) <=0) {
          println(true);
          return true;
        }
      }
    }
    return false;
  }
}
