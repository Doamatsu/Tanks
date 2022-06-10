public class Button{
  float y;
  String words;
  public Button(String words_, float y_){
    words = words_;
    y = y_;
  }
  void display(){
    fill(#42A799);
    rect(width/2,y,100,76);
    text(words,width/2,y+38);
  }
}
