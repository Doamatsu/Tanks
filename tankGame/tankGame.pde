static Tank current;
ArrayList<Tank>Tanks;
void setup() {
  size(1000, 750);
  Tanks = new ArrayList<Tank>();
  Tank Tester = new Tank(100, 600, "P1", 50);
  StandardTank Tester2 = new StandardTank(900, 600, #0000FF, "P 2", 70);
  Tanks.add(Tester);
  Tanks.add(Tester2);
  current = Tester;
}
void draw() {
  background(255);
  float incrementBox = 0;
  for (Tank o : Tanks) {
    playerBox(width/8 + incrementBox * 275, 10,o.getName(),o.getHP(),o.getRotation(),o.getColor());
    incrementBox++;
    o.display();
  }
  current.display();
  //textbox
  
  
}

void playerBox(float x,float y,String name_, float HP, float angle, color c){
  fill(c);
  rect(x,y,250,92);
  fill(0);
  textSize(15);
  text("Player 1: " + name_, x+10,y+20);
  text("HP: " + HP, x+10, y+40);
  text("Angle: " + angle, x+10, y+60);
  
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
    current.r -= .05;
    if (current.r<-3.339998) {
      current.r = -3.339998;
    }
  }
  if (key == 's') {
    current.r += .05;
    //move gun left
    if (current.r<-3.339998) {
      current.r = -3.339998;
    }
    if (current.r > .04) {
      current.r = .01;
    }
  }
  
}
