public class Button {
  float y;
  String words;
  float length = 200;
  public Button(String words_, float y_) {
    words = words_;
    y = y_;
  }
  void display() {
    fill(overButton());
    rect(width/2 - length/2, y, length, 76);
    textAlign(CENTER);
    fill(#000000);
    textSize(25);
    text(words, width/2, y+40);
  }
  color overButton() {
    if (mouseX >= width/2-length/2&& mouseX <= width/2 &&
      mouseY >= y && mouseY <= y+76) {
      return #296F65;
    } else {
      return #42A799;
    }
  }
}
