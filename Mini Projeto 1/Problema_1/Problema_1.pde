//Variáveis globais
float raio;
float x, y;
float vx, vy;
float ax, ay;
float chao;
float uc;
boolean first;

public void setup() {
  
  //Configurações da animação
  int frameRate = 60;
  size(500, 500);
  frameRate(frameRate);
  
  //Inicializando variáveis globais
  raio = 10;
  chao = height/2;
  uc = 1;
  x = raio;
  y = chao-raio;
  vx = (width-2*raio)/(frameRate*2);
  vy = -10*uc;
  ax = 0;
  ay = 0.5*uc;
  first = true;
}

public void draw() {
  
  //Desenho
  background(#E5DDC8);
  fill(#01949A);
  noStroke();
  rect(0, chao, width, height);
  stroke(0);
  line(0, chao, width, chao);
  fill(#DB1F48);
  circle(x, y, 2*raio);
  
  //Colisões
  if(!first && ((x+raio >= width) || (x-raio <= 0))){
    vx *= -1;
  }
  if(!first && (y+raio >= chao)){
    vy *= -1;
    vy += ay;
  }
  
  //Atualização de parâmetros
  x = x + vx;
  y = y + vy;
  vx = vx + ax;
  vy = vy + ay;
  first = false;
}
