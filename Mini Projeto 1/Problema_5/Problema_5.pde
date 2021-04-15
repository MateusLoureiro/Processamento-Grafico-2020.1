float x, y, z;
int a = 0;

void setup() {
 size(800, 800, P3D);
 x = width/2;
 y = width/2;
 z = width/2;
}

void draw() {
  
  background (#E5DDC8);
  translate (400, 400, 0);
  
  rotateX(radians(238));
  rotateY(radians(175));
  rotateZ(radians(40));
  
  pushMatrix();
  
  stroke(#DB1F48);
  line(0, 0, 0, -x, 0, 0);
  
  popMatrix();
  
  pushMatrix();
  
  stroke(#01949A);
  line(200, 0, 0, 200, 3*y, 0);
  
  popMatrix();
  
  pushMatrix();
  
  stroke(#0043e0);
  line(200, 0, 0, 200, 0, z);
  
  popMatrix();
  rotateX(radians(60));
  pushMatrix();
  strokeWeight(4);
  stroke(#004369);
  pushMatrix();
  fill(#E5DDC8);
  ellipse(100, 100, 200, 200);
  ellipse(100,100,2,2);
  popMatrix();
  pushMatrix();
  noFill();
  rect(0, 0, 200, 200);
  popMatrix();
  popMatrix();

  translate(100, 100, 0);
  rotateZ(radians(-a));
  pushMatrix();
  translate(-100,-100,0);
  rotateX(radians(90));
  stroke(#DB1F48);
  ellipse(112.5, 25, 50, 50);
  pushMatrix();
    
  translate(112.5, 25, 0);
  stroke(#01949A);
  rotate(radians(a*4));
  ellipse(0, 25, 5, 5);
    
  popMatrix();
  popMatrix();
  
  
  a += 1;
}
