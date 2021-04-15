//Variáveis globais
int raio;
int dist;
float theta;
float xCentro, yCentro;
int t;

public void setup(){

  //Configurações da animação
  size(1000, 1000);
  int frameRate = 60;
  frameRate(frameRate);
   
  //Inicializando variáveis globais
  raio = 5;
  dist = 20;
  theta = radians(90)/(frameRate*2);
  xCentro = 0;
  yCentro = 0;
  t = 0;
  
  //Desenhando o fundo
  background(#E5DDC8);
  translate(width/2, height/2);
  stroke(#01949A);
  line(-width/2, 0, width/2, 0);
  line(0, -height/2, 0, height/2);

}

public void draw(){
  
  //Desenho
  translate(width/2, height/2);
  translate(xCentro, 0);
  fill(#DB1F48);
  noStroke();
  rotate(-t*theta);
  circle(-dist, 0, raio*2);
  rotate(t*theta);
  
  if(t*theta == PI){
    xCentro -= dist;
    dist *= 2;
  } 
  if(t*theta == 2*PI){
    xCentro += dist;
    dist *= 2;
    t = 0;
  }
  t++;
}
