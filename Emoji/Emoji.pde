float x = 400;
float y = 400;
float xspeed = 1;
float yspeed = 1;

void setup ()
{
  size(800, 800); 
}
void draw () {
  background(131);
  noStroke();
  
  //Cara
  fill(255, 255, 0);
  ellipse(x, y, 400, 400);
  
  //Ojos
  fill(255);
  ellipse(x - 100, y - 50, 150, 150); //Ojo Izquierdo
  ellipse(x + 100, y - 50, 150, 150); //Ojo Derecho
  
  //Pupilas
  fill(0);
  ellipse(x - 120, y - 50, 50, 50);
  ellipse(x + 120, y - 50, 50, 50);
  
  //boca
  fill(255, 152, 152);
  ellipse(x, y + 80, 130,180);
  
  x = x + xspeed;
  y = y + yspeed;
  
  if ((x + 200 > width || x - 200 < 0))
  {
    xspeed = xspeed * -1;
  }
  if ((y + 200 > height || y - 200 < 0))
  {
    yspeed = yspeed * -1;
  }
}
