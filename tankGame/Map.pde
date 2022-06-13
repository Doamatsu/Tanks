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
      for (int j = 10; j<map.length; j++) {
        map[i][j] = true;
      }
    }
    map[0][10] = false;map[1][10] = false;map[2][10] = false;map[3][10] = false;
    map[20][10] = false;map[19][10] = false;map[18][10] = false;map[17][10] = false;
    map[39][10] = false;map[38][10] = false;map[37][10] = false;map[36][10] = false;
    map[20][11] = false;map[19][11] = false;map[18][11] = false;
    map[39][11] = false;map[38][11] = false;map[37][11] = false;
    map[0][11] = false;map[1][11] = false;map[2][11] = false;
    map[20][12] = false;map[19][12] = false;map[18][12] = false;
    map[39][12] = false;map[38][12] = false;map[37][12] = false;
    map[0][12] = false;map[1][12] = false;map[2][12] = false;
  }
  void display() {
    for (int i = 0; i<map.length; i++) {
      for (int j = 0; j<map.length; j++) {
        if (map[i][j] == true) {

          //println("i " + i + " j " + j);
          //stroke(1);
          noStroke();
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
        //println(ammoX + " " + ammoY);
        float mapX = i*20;
        float mapY = j*20;
        boolean horizontal = ammoX>=mapX && ammoX <= mapX+20;
        boolean vertical = ammoY>= mapY && ammoY <= mapY+20;
        if (map[i][j] == true && (horizontal && ammoY>=mapY-2 && ammoY<=mapY+2 ||
          horizontal && ammoY>= mapY +20-2 && ammoY <= mapY+20 +2 || 
          vertical && ammoX >= mapX-2 && ammoX <= mapX+20+2 || 
          vertical && ammoX >= mapX+20-2 && ammoX <= mapX+20+2)) {//if it touches side of block

          map[i][j] = false;
          return true;
        }else if (ammoX>width || ammoX<0 || ammoY > height) {
          return true;
        }
      }
    }
    return false;
  }
  boolean touchY(Tank tank) {//returns true if touching bottom of tank
    boolean leftVertex = false;
    boolean rightVertex =false;
    for (int i = 0; i<map.length; i++) {
      for (int j = 0; j<map.length; j++) {
        //print(map[i][j]);
        if(map[i][j] == true && tank.getY() == j*20 && tank.getX()-20 >=i*20 && tank.getX()-20<=i*20+20){
          leftVertex = true;
        }
        if(map[i][j] == true && tank.getY() == j*20 && tank.getX()+20 >=i*20 && tank.getX()+20<=i*20+20){
          rightVertex = true;
        }
        //if (map[i][j] == true && dist(0, tank.getY(), 0, j*20) <=0 && dist(tank.getX(), 0, i*20, 0) <=10 ) {

        //  //println(i + " " + j);
        //  return true;
        //}
      }
    }
    return leftVertex||rightVertex;
  }
  int touchX(Tank tank) { // 0 is no 1 is left 2 is right
    for (int i = 0; i<map.length; i++) {
      for (int j = 0; j<map.length; j++) {
        //if grass and (right vertex touches  or left vertex touches)
        if (map[i][j] == true) {
          if (dist(tank.getRightX(), tank.getRightY(), i*20, j*20) <=0) {
            return 2;
          } else if (dist(tank.getLeftX(), tank.getLeftY(), i*20+20, j*20) <=0) {
            return 1;
          }
        }
      }
    }
    return 0;
  }

  //remove methods
  void remove(int x_, int y_) {
    map[x_][y_] = false;
  }
}
