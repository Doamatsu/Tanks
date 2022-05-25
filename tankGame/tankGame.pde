static Tank current;
ArrayList<Tank>Tanks;
float r;
void setup(){
  size(1000,750);
  Tanks = new ArrayList<Tank>();
  r = 0.01;
  Tank Tester = new Tank(100,600);
  Tank Tester2 = new Tank(900,600,#0000FF);
  Tanks.add(Tester);
  Tanks.add(Tester2);
  current = Tester;
}
void draw(){
  background(255);
  for (Tank o : Tanks) {
        o.display();
      }
  current.display();
}
void keyPressed(){
  println(r);
  if(key == 'a'){
    current.move("left");
  }
  if(key == 'd'){
    current.move("right");
  }
  if(key == 'w'){
    r -= .05;
    if(r<-3.339998){
      r = -3.339998;
    }
  }
  if(key == 's'){
    r += .05;
    //move gun left
    if(r<-3.339998){
      r = -3.339998;
    }
    if(r > .04){
      r = .01;
    }

  }
}
