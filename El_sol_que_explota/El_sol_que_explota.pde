//Variables
int x = 300;
int y = 300;
int ancho = 30;
int alto = 30;
int xPositionNubeIz = 100;
int xPositionNubeDe = 400;
int velNubeDe = 1;
int velNubeIz = 1;
color c1 = color(255, 255, 128);
void setup()
{
  size(600, 600);
}

void draw()
{
  noStroke();
  // cielito azul
  background(183,228,244);
  // sol 
  fill(c1);
  ellipse(x,y,ancho,alto);
  
  // la tierra bloqueando la mitad del sol
  fill(76, 168, 67);
  rect(0, 500, 600, 100);
  
  // nubes 
  fill(255);
  ellipse(xPositionNubeIz, 140, 40, 30);
  ellipse(xPositionNubeIz +50, 140, 80, 60);
  ellipse(xPositionNubeIz +100, 140, 40, 30);
  
  ellipse(xPositionNubeDe, 80, 40, 30);
  ellipse(xPositionNubeDe + 50, 80, 80, 60);
  ellipse(xPositionNubeDe +100, 80, 40, 30);
  
  // casita
  fill(#CB4154);
  rect(450, 420, 120, 120);
  fill(#CBB3A2);
  triangle(450, 420, 510, 300, 570, 420);
  
  xPositionNubeIz += velNubeIz;
  xPositionNubeDe -= velNubeDe;
  
  if(xPositionNubeIz > 500 || xPositionNubeIz < 20) {
    velNubeIz = velNubeIz * -1;
  }
  if(xPositionNubeDe > 500 || xPositionNubeDe < 20) {
    velNubeDe = velNubeDe * -1;
  }
  if(ancho > 300 || alto > 300)
  {
    c1 = color(#FF4405);
  }
  
  ancho++;
  alto++;
}
