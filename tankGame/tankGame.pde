static Tank current;
ArrayList<Tank>Tanks;
float r;
void setup() {
  size(1000, 750);
  Tanks = new ArrayList<Tank>();
  r = 0.01;
  Tank Tester = new Tank(100, 600, "P1", 50);
  StandardTank Tester2 = new StandardTank(900, 600, #0000FF, "P 2", 70);
  Tanks.add(Tester);
  Tanks.add(Tester2);
  current = Tester;
}
void draw() {
  background(255);
  for (Tank o : Tanks) {
    o.display();
  }
  current.display();
  
  //textbox
  playerBox(125,10,"Doormatsu");
  
  
}

void playerBox(float x,float y,String name_){
  fill(255,0,0);
  rect(x,y,250,92);
  fill(0);
  text("Player 1: " + name_, x+10,y+20);
  
  
}
void keyPressed() {
  //println(r);
  if (key == 'a') {
    current.move("left");
  }
  if (key == 'd') {
    current.move("right");
  }
  if (key == 'w') {
    r -= .05;
    if (r<-3.339998) {
      r = -3.339998;
    }
  }
  if (key == 's') {
    r += .05;
    //move gun left
    if (r<-3.339998) {
      r = -3.339998;
    }
    if (r > .04) {
      r = .01;
    }
  }
  
}
