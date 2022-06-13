import java.util.*;
static Tank current;
static ArrayList<Tank>Tanks;
boolean shooting = false;
int countdown;
boolean tankRemove = false;
Map map;
boolean debug = false;
boolean mainMenu = true;
boolean pMenu = false;
boolean instructions = false;
Button pMenuButton;
Button instructionsButton;
Button twoPlayer;
Button threePlayer;
Button reset;
Button returnButton;
Tank Tester,Tester2,Tester3;
boolean wait;

static void next() {
  //println(Tanks.toString());
  int index = Tanks.indexOf(current);
  //println(index + " "+ Tanks.size());
  if (index == Tanks.size()-1){
    current = Tanks.get(0);
    current.resetStamina();
  } else {
    index++;
    current = Tanks.get(index);
    current.resetStamina();
  }
  //println(Tanks.indexOf(current));
}

void setup() {
  size(800, 800);
  countdown = 0;
  wait = true;
  Tanks = new ArrayList<Tank>();
  map = new Map();
  pMenuButton = new Button("PLAYER MENU", height/3);
  instructionsButton = new Button("INSTRUCTIONS", height/3 + 100);
  twoPlayer = new Button("2 PLAYERS",height/3);
  threePlayer = new Button("3 PLAYERS", height/3 + 100);
  reset = new Button("RESET", height/2 - 100);
  returnButton = new Button("RETURN",650);
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
  }else if(instructions){
    background(255);
    returnButton.display();
    textSize(25);
    textAlign(LEFT);
    
    text("Try to shoot the other players to death.",width/7,100);
    text("Shooting the floor will break the green blocks.",width/7,130);
    text("Falling out of the world will result in your death.",width/7,160);
    text("Press a or d to move, w or s to adjust gun angle", width/7,190);
    text("SPACE BAR TO SHOOT", width/7,220);
    text("All tanks will be able to move for a lil bit every turn.", width/7,250);
    text("Press j for debug button",width/7,280);
    text("Press k for during debug for kill firstest tank button",width/7,310);
  }else if (pMenu) {//PLAYER MENU
    background(255);
    textSize(40);
    text("Select the Number of Players", width/2, height/5); //TITLE TEXT
    twoPlayer.display();
    threePlayer.display();
    returnButton.display();
  } else if (Tanks.size() == 1) {
    background(255);
    fill(0, 0, 0);
    textAlign(CENTER);
    textSize(100);
    text(Tanks.get(0).getName() + " WINS!!!", width/2, height/4);
    stroke(1);
    reset.display();
    
  }else{
    background(255);
    wait = countdown <120;
    if(countdown > 100 && countdown < 150){
      textAlign(CENTER);
      fill(#000000);
      textSize(75);
      text("START",width/2,height/4-20);
    }
    countdown++;
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
      playerBox(width/8 + incrementBox * 250, 10, o.getName(), o.getHP(), o.getRotation(), o.getColor(),o.getStamina());
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

void playerBox(float x, float y, String name_, float HP, float angle, color c,float stamina) {
  fill(c);
  rect(x, y, 150, 92);
  fill(0);
  textAlign(LEFT);
  textSize(15);
  fill(#FFFFFF);
  text("Player: " + name_, x+10, y+20);
  text("HP: " + HP, x+10, y+40);
  text("Angle: " + angle, x+10, y+60);
  text("Stamina: " + stamina, x+10,y+80);
}

void mouseClicked() {
  if (mainMenu) {
    if (pMenuButton.insideButton()) {
      mainMenu = false;
      pMenu = true;
    }
    if(instructionsButton.insideButton()){
      mainMenu = false;
      instructions = true;
    }
  }else if(instructions){
    if(returnButton.insideButton()){
      instructions = false;
      mainMenu = true;
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
    if(returnButton.insideButton()){
      pMenu = false;
      mainMenu = true;
    }
  }else{
    if(reset.insideButton()){
      Tanks.clear();
      mainMenu = true;
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
  if(debug && key == 'k'){
    Tanks.remove(0);
  }
    
  if (shooting == false && !wait) {
    if(debug && key == 't'){
      next();
    }
      if (keyCode == ' ') {
    if (!shooting) {
      shooting = true;
      current.shoot();
    }
  }
    if (!current.touchLeft() && current.getStamina()>0) {
      if (key == 'a') {
        current.move("left");
        current.decreaseStamina();
      }
    }
    if (!current.touchRight() && current.getStamina()>0) {
      if (key == 'd') {
        current.move("right");
        current.decreaseStamina();
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


  }
  
}
