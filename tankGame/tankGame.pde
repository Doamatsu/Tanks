import java.util.*;
static Tank current;
static ArrayList<Tank>Tanks;
boolean shooting = false;
int countdown;
boolean tankRemove = false;
Map map;
boolean debug = true;
boolean mainMenu = true;
boolean pMenu = false;
boolean instructions = false;
Button pMenuButton;
Button instructionsButton;
Button twoPlayer;
Button threePlayer;
Tank Tester,Tester2,Tester3;
static void next() {
  int index = Tanks.indexOf(current);
  //println(index);
  if (Tanks.indexOf(current) == Tanks.size()-1) {
    current = Tanks.get(0);
  } else {
    current = Tanks.get(Tanks.indexOf(current) + 1);
  }
}
void setup() {
  size(800, 800);
  countdown = 0;
  Tanks = new ArrayList<Tank>();
  map = new Map();
  pMenuButton = new Button("PLAYER MENU", height/3);
  instructionsButton = new Button("INSTRUCTIONS", height/3 + 100);
  twoPlayer = new Button("2 PLAYERS",height/3);
  threePlayer = new Button("3 PLAYERS", height/3 + 100);
  
}

void draw() {
  if (mainMenu) {//MAIN MENU
    background(255);
    textSize(128);
    fill(#00503b);
    textAlign(CENTER);
    text("TANK WARS", width/2, height/5); //TITLE TEXT
    pMenuButton.display(); //PLAYER MENU BUTTON
    instructionsButton.display(); //INSTRUCTIONS BUTTON
  } else if (pMenu) {//PLAYER MENU
    background(255);
    textSize(40);
    text("Select the Number of Players", width/2, height/5); //TITLE TEXT
    twoPlayer.display();
    threePlayer.display();
  } else if (Tanks.size() == 1) {
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
    for (Tank o : Tanks) {
      playerBox(width/8 + incrementBox * 250, 10, o.getName(), o.getHP(), o.getRotation(), o.getColor());
      incrementBox++
        ;
      if (!map.touchY(o)) {//fall if not touching floor
        o.tankFall();
      }
      //if touch left or right stop that
      if (map.touchX(o) == 1) {
        o.setLeft(true);
      } else if (map.touchX(o) == 2) {
        o.setRight(true);
      } else {
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
  rect(x, y, 150, 92);
  fill(0);
  textAlign(LEFT);
  textSize(15);
  text("Player 1: " + name_, x+10, y+20);
  text("HP: " + HP, x+10, y+40);
  text("Angle: " + angle, x+10, y+60);
}

void mouseClicked() {
  if (mainMenu) {
    if (pMenuButton.insideButton()) {
      mainMenu = false;
      pMenu = true;
    }
  }else if(pMenu){
    if(twoPlayer.insideButton()){
      Tank Tester = new Tank(100, 100, #FF0000, "P1", 50);
  Tank Tester2 = new Tank(700, 100, #0000FF, "P2", 50);
      Tanks.add(Tester);
      Tanks.add(Tester2);
      current = Tester;
      pMenu = false;
    }
    if(threePlayer.insideButton()){
      Tank Tester = new Tank(100, 100, #FF0000, "P1", 50);
  Tank Tester2 = new Tank(700, 100, #0000FF, "P2", 50);
      Tank Tester3 = new Tank(350,100, #DECB24, "P3", 50);
      Tanks.add(Tester);
      Tanks.add(Tester2);
      Tanks.add(Tester3);
      current = Tester;
      pMenu = false;
    }
  }
}
void keyPressed() {
  //println(r);
  //if a tank isn't shooting
  if(!mainMenu && !pMenu && !instructions){
    if (key == 'j') {
    debug = !debug;
  }
  if (shooting == false) {
    if (!current.touchLeft()) {
      if (key == 'a') {
        current.move("left");
      }
    }
    if (!current.touchRight()) {
      if (key == 'd') {
        current.move("right");
      }
    }

    if (key == 'w') {
      current.r -= .05;
      if (current.r<-3.1399982) {
        current.r = -3.1399982;
      }
    }
    if (key == 's') {
      current.r += .05;
      //move gun left
      if (current.r<-3.1399982) {
        current.r = -3.1399982;
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
  
}
