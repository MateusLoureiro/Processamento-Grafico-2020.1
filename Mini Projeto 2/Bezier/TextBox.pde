class TextBox {
  float x, y, h, w;
  String label;
  
  TextBox (float xx, float yy, float ww, float hh, String lbl1){
    x = xx;
    y = yy;
    w = ww;
    h = hh;
    label = lbl1;
  }
  
  void display(){
    noStroke();
    fill(#E5DDC8);
    rect(x, y, w, h, 5);
    textFont(f);
    textAlign(CENTER);
    if(state == 0){
      fill(100);
      text(label, x + w/2, y + h/2 + textSize/4);
    }
    else if(state == 1){
      fill(#004369);
      text("CHANGE TO: " + temp_eval, x + w/2, y + h/2 + textSize/4);
    }
  }
  
  boolean inside(float xx, float yy){
    float dx = xx - x;
    float dy = yy - y;
    return (dx >= 0 && dx <= w && dy >= 0 && dy <= h);
  }
  
  void exec(){
    if(state == 0){
      state = 1;
      temp_eval = 0;
    }
  }
}
