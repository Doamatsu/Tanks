public class Button{
  float x,y;
  String words;
  public Button(String words_, float x_, float y_){
    words = words_;
    x = x_;
    y = y_;
  }
  void display(){
    fill(#42A799);
    rect(x,y,30,76);
    text(words,x+15,y+38);
  }
}
