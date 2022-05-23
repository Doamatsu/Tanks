static Tank current;
ArrayList<Tank>Tanks;
final float rotation = 0.1;
void setup(){
  size(1000,750);
  Tanks = new ArrayList<Tank>();
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
  if(key == 'a'){
    current.move("left");
  }
  if(key == 'd'){
    current.move("right");
  }
  if(key == 'w'){
    current.move("gun right");
  }
  if(key == 's'){
    current.move("gun left");
  }
}
