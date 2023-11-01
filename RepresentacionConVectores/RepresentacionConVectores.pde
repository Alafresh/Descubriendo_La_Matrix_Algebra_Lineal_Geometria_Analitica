// declaracion de variables
float x = 100;
float y = 100;
float xSpeed = 2;
float ySpeed = 2;

// funcion corre una vez para inicializar el programa
void setup()
{
  size(640,360);
  background(255);
}
// funcion que se ejecuta continuamente hasta que el programa se detiene
void draw()
{
  // suma de vectores
  x = x + xSpeed;
  y = y + ySpeed;
  // detecion de colision
  if ((x > width || x < 0))
  {
    xSpeed = xSpeed * -1;
  }
  if ((y > height || y < 0))
  {
    ySpeed = ySpeed * -1;
  }
  // limpiamos pantalla
  background(255);
  fill(0, 250, 215);
  strokeWeight(10);
  stroke(178, 0, 250);
  
  ellipse(x, y, 100, 100);
}
