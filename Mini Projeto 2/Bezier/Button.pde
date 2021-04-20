class Button {
  float x, y, h, w;
  String label;
  int action;
  
  Button (float xx, float yy, float ww, float hh, int aa, String lbl){
    x = xx;
    y = yy;
    w = ww;
    h = hh;
    label = lbl;
    action = aa;
  }
  
  void display(){
    noStroke();
    fill(#DB1F48);
    rect(x, y, w, h, 5);
    textFont(f);
    fill(#E5DDC8);
    textAlign(CENTER);
    text(label, x + w/2, y + h/2 + textSize/4);
  }
  
  boolean inside(float xx, float yy){
    float dx = xx - x;
    float dy = yy - y;
    return (dx >= 0 && dx <= w && dy >= 0 && dy <= h);
  }
  
  void exec(){
    if(action == 0){         //new curve
      println();
      if(curvas[pos].points.length == 0)
        return;
      add_curva();
    }
    else if(action == 1){    //del curve
      delete_curva();
    }  
    else if(action == 2){    //next curve
      if(curvas[pos].points.length == 0){
        delete_curva();
        return;
      }
      
      curvas[pos].set_on(false);
      pos++;
      if(pos == curvas.length)
        pos = 0;
      curvas[pos].set_on(true);
    }
    else if(action == 3){    //toggle points
      vis_points = !vis_points;
    }
    else if(action == 4){    //toggle polig
      vis_polig = !vis_polig;  
    }
    else{                    //toggle curve
      vis_curve = !vis_curve;
    }
  }
}
