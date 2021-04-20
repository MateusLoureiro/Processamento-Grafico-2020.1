class EvalBox {
  float x, y, h, w;
  String label;
  
  EvalBox(float xx, float yy, float ww, float hh, String lbl1){
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
    fill(#004369);
    text(label + global_eval, x + w/2, y + h/2 + textSize/4);
  }
}
