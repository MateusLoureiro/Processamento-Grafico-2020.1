class Point {
  float x, y, raio;
  
  Point (float xx, float yy){
    x = xx;
    y = yy;
    raio = 10;
  }
  
  Point (Point p1, Point p2, float t){
    x = (1-t)*p1.x + t*p2.x;
    y = (1-t)*p1.y + t*p2.y;    
  }
  
  void setCoord(float new_x, float new_y){
    x = new_x;
    y = new_y;
  }
  
  void display(boolean cor){
    noStroke();
    if(cor)
      fill(#DB1F48);
    else
      fill(200);
    circle(x, y, raio);
  }
  
  boolean inside(){
    float dx = mouseX-this.x;
    float dy = mouseY-this.y;
    return dx*dx + dy*dy <= raio*raio;
  }
}
