import java.util.*;
public class Map{
  private boolean[][]map; //size is 800 x 800
  int SQUARESIZE = width/100;
  public Map(){
    map = new boolean[100][100];
    for(int i = 0; i<map.length;i++){
      for(int j = 0; j<map.length;j++){
        map[i][j] = false; //sets everything to space for now
      }
    }
    for(int i = 0; i<map.length;i++){
      for(int j = 0;j<map.length;j++){
        map[i][j] = true;
      }
    }
  }
  void display(){
for(int i = 0; i<map.length;i++){
      for(int j = 0;j<map.length;j++){
        if(map[i][j] = true){
          stroke(1);
          fill(#00FF00);
          square(i,j,SQUARESIZE);
        }
      }
        
  }
  }

}
