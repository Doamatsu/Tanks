public class Button {
  float y;
  String words;
  float length = 200;
  public Button(String words_, float y_) {
    words = words_;
    y = y_;
  }
  void display() {
    if(insideButton()){
      fill(#296F65); 
    }else{
      fill(#42A799);
    }
    rect(width/2 - length/2, y, length, 76);
    textAlign(CENTER);
    fill(#000000);
    textSize(25);
    text(words, width/2, y+40);
  }
  boolean insideButton() {
    return(mouseX >= width/2-length/2&& mouseX <= width/2 + length &&
      mouseY >= y && mouseY <= y+76);
  }
}
