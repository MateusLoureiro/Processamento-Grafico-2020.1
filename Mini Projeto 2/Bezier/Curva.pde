class Curva {
  Point[] points;
  int eval;
  boolean on;
  
  Curva (){
    this.eval = global_eval;
    points = new Point[0];
    on = true;
  }
  
  void add_point(Point p){
    this.points = (Point[])append(this.points, p);
  }
  
  void delete_point(int ind){
    for(int i = ind; i < points.length-1; i++){
      points[i] = points[i+1];
    }
    points = (Point[])shorten(points);
  }
  
  void set_on(boolean flag){
    on = flag;
  }
  
  void set_eval(int x){
    if(x <= 0)
      eval = 1;
    else
      eval = x;
  }
  
  void display(){
    if(points == null || points.length == 0)
      return;
    
    if(vis_polig)
      this.display_polig();
    if(vis_points)
      this.display_points();
    if(vis_curve)
      this.display_curve();
  }
  
  void display_points(){
    for(Point p : points)
      p.display(on);
  }
  
  void display_polig(){
    if(on)
      stroke(#01949A);
    else
      stroke(200);
    for(int i = 1; i < points.length; i++)
      line(points[i].x, points[i].y, points[i-1].x, points[i-1].y);
  }
  
  void display_curve(){
    Point[] curva = new Point[eval+1];
    curva[0] = points[0];
    Point[] temp = new Point[points.length];
    float t;
    for(int it = 1; it <= eval; it++){
      arrayCopy(points, temp);
      t = ((float)it)/eval;
      for(int nivel = 1; nivel <= points.length; nivel++){
        for(int pt = 0; pt < points.length - nivel; pt++){
          temp[pt] = new Point(temp[pt], temp[pt+1], t);
        }
      }
      curva[it] = temp[0];
    }
    
    if(on)
      stroke(#004369);
    else
      stroke(200);
    for(int i = 0; i < eval; i++)
      line(curva[i].x, curva[i].y, curva[i+1].x, curva[i+1].y);
  }
}
