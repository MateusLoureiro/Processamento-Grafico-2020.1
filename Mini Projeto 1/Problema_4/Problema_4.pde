//Variáveis globais
float uc;
float theta;
float v2, v1;
float raio1, raio2;
int t;

public void setup(){
  
  //Configuração da animação
  size(500, 500);
  int frameRate = 60;
  frameRate(frameRate);
  
  //Inicialização das variáveis globais
  uc = min(width, height)/240;
  raio1 = 100*uc;
  raio2 = 25*uc;
  theta = -(radians(360)/(frameRate));
}

public void draw(){
  
  //Desenho
  background(#E5DDC8);
  
  translate(width/2, height/2);
  noFill();
  stroke(#004369);
  circle(0, 0, 2*raio1);
  
  rotate(raio2*t*theta/raio1);
  translate(raio1 - raio2, 0);
  stroke(#01949A);
  circle(0, 0, 2*raio2);
  
  rotate(-t*theta);
 
  noStroke();
  fill(#DB1F48);
  circle(raio2, 0, 5);
  
  rotate(t*theta);
  translate(-(raio1 - raio2), 0);
  
  t++;
}
