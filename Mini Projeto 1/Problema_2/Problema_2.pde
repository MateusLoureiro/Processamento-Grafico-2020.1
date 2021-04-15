//Variáveis globais
float uc;
float raio;
float braco, ante;
float theta;
float angParada;
int t;

public void setup(){
  
  //Configurações da animação
  int frameRate = 60;
  size(500, 500);
  frameRate(frameRate);
  
  //Inicializando variáveis globais
  t = 0;
  raio = 10;
  uc = min(width, height)/20;
  braco = 2*uc;
  ante = 3*uc;
  angParada = radians(45);
  theta = -angParada/(frameRate*2);
}

public void draw(){
  
  //Desenho
  background(#E5DDC8);
  stroke(#01949A);
  strokeWeight(3);
 
  translate(width/2, height/2);
  rotate(theta*t);
  line(0, 0, 0, braco);
  
  translate(0, braco);
  rotate(theta*t);
  line(0, 0, 0, ante);
 
  translate(0, ante);
  noStroke();
  fill(#DB1F48);
  circle(0, 0, raio);
  
  translate(0, -ante);
  rotate(-theta*t);
  circle(0, 0, raio);
  
  translate(0, -braco);
  rotate(-theta*t);
  circle(0, 0, raio);
  
  if(abs(theta*t) < angParada)
    t++;
}
