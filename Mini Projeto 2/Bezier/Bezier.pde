PFont f;
Curva[] curvas = new Curva[0];
int pos;
int point_edit = -1;
Menu menu;
boolean vis_points = true, vis_polig = true, vis_curve = true;
int textSize;
int state;
int global_eval, temp_eval;

public void setup(){
  size(1400, 1000);
  menu = new Menu(0, 0, width/4, height);
  pos = 0;
  global_eval = 1000;
  curvas = (Curva[])append(curvas, new Curva());
  textSize = 16;
  f = createFont("Ubuntu Bold", textSize, true); 
  state = 0;
}

public void draw(){
  background(#E5DDC8);
  for(Curva curva : curvas)
    curva.display();
  menu.display();
}

void mouseClicked(){
  if(mouseButton == LEFT){
    if(menu.inside(mouseX, mouseY)){
      for(Button button : menu.buttons)
        if(button.inside(mouseX, mouseY))
          button.exec();
      if(menu.input.inside(mouseX, mouseY))
        menu.input.exec();
    }
    else  
      curvas[pos].add_point(new Point(mouseX, mouseY));
  }
  
  if(mouseButton == RIGHT){
    for(int i = 0; i < curvas[pos].points.length; i++){
      if(curvas[pos].points[i].inside())
        curvas[pos].delete_point(i);
    }
  }
}

void mouseDragged(){
  if(mouseButton != LEFT)
    return;
  
  if(point_edit == -1){
    for(int i = 0; i < curvas[pos].points.length; i++){
      if(curvas[pos].points[i].inside())
        point_edit = i;
    }
  }
  
  if(point_edit != -1)
    curvas[pos].points[point_edit].setCoord(mouseX, mouseY);
}

void mouseReleased(){
  point_edit = -1;
}

void keyPressed(){
  if(state == 1){
    if(key == ENTER || key == RETURN){
      global_eval = temp_eval;
      for(Curva curva : curvas)
        curva.set_eval(global_eval);
      state = 0;
    }
    else if(key == BACKSPACE){
      temp_eval /= 10;
    }
    else if(key >= '0' && key <= '9'){
      temp_eval *= 10;
      temp_eval = temp_eval + (key-'0');
    }
  }
}

void add_curva(){
  curvas = (Curva[])append(curvas, new Curva());
  curvas[pos].set_on(false);
  pos++;
  for(int i = curvas.length - 2; i >= pos; i--)
    curvas[i+1] = curvas[i];
  curvas[pos] = new Curva();
  curvas[pos].set_on(true);
}

void delete_curva(){
  if(curvas.length == 1){
    curvas[0] = new Curva();
    return;
  }
  
  for(int i = pos; i < curvas.length-1; i++)
    curvas[i] = curvas[i+1];
  curvas = (Curva[])shorten(curvas);
  
  if(pos == curvas.length)
    pos = 0;
  curvas[pos].set_on(true);
}
