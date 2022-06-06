import java.util.*;
static Tank current;
ArrayList<Tank>Tanks;
boolean shooting = false;
int countdown;
boolean tankRemove = false;
Map map;
boolean debug = true;
void setup() {
  size(800, 800);
  countdown = 0;
  Tanks = new ArrayList<Tank>();
  map = new Map();
  Tank Tester = new Tank(100, 100, #FF0000, "P1", 50);
  Tank Tester2 = new Tank(700, 100, #0000FF, "P2", 50);
  Tanks.add(Tester);
  Tanks.add(Tester2);
  current = Tester;
}
void draw() {
  if (Tanks.size() == 1) {
    background(255);
    fill(0, 0, 0);
    textSize(100);
    text(Tanks.get(0).getName() + " WINS!!!", width/3, height/2);
  } else {
    background(255);
    map.display();
    float incrementBox = 0;
    int i =0;
    int removedOne = 0;

    if (tankRemove) {
      tankRemove = false;
      Tanks.remove(removedOne);
    }
    current.display();
    if (shooting) {
      countdown++;
    }
    if (countdown == 20) {
      if (current == Tanks.get(0)) {
        current = Tanks.get(1);
      } else {
        current = Tanks.get(0);
      }
      shooting = false;
      countdown =0;
    }
    for (Tank o : Tanks) {
      playerBox(width/8 + incrementBox * 275, 10, o.getName(), o.getHP(), o.getRotation(), o.getColor());
      incrementBox++
        ;
      if (!map.touchY(o)) {//fall if not touching floor
        o.tankFall();
      }
      //if touch left or right stop that
      if(map.touchX(o) == 1){
        o.setLeft(true);
      }else if(map.touchX(o) == 2){
        o.setRight(true);
      }else{
        o.setRight(false);
        o.setLeft(false);
      }

      if (o.getHP() <=0) {
        tankRemove = true;
        removedOne = i;
      }
      o.display();
      i++;
    }

    fill(255);
  }

  //textbox
}

void playerBox(float x, float y, String name_, float HP, float angle, color c) {
  fill(c);
  rect(x, y, 250, 92);
  fill(0);
  textSize(15);
  text("Player 1: " + name_, x+10, y+20);
  text("HP: " + HP, x+10, y+40);
  text("Angle: " + angle, x+10, y+60);
}
void keyPressed() {
  //println(r);
  //if a tank isn't shooting
  if (key == 'j') {
    debug = !debug;
  }
  if (shooting == false) {
    if(!current.touchLeft()){
      if (key == 'a') {
      current.move("left");
    }
    }
    if(!current.touchRight()){
      if (key == 'd') {
      current.move("right");
    }
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

  if (keyCode == ' ') {
    if (!shooting) {
      shooting = true;
      current.shoot();
    }
  }
}
