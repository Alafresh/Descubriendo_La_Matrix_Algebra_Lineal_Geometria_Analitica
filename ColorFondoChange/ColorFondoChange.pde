int colorFondo = 150;

void setup()
{
  size(400,200);
}
void draw()
{
  background(colorFondo);
}
void keyPressed() {
  if(key == 'R' || key == 'r')
  {
    colorFondo = color(255,0,0); // Rojo
  }
  if(key == 'T' || key == 't') 
  {
    colorFondo = color(0,255,0); // Verde
  }
  if(key == 'Y' || key == 'y')
  {
    colorFondo = color(0,0,255); // Azul
  }
  if(key == 'U' || key == 'u')
  {
    colorFondo = color(150,150,150); // Gris
  }
}
