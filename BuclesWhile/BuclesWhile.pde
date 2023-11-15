

void setup() {
  size(500, 200);
}

  int x = 50;
  int velocidad = 2;
  
void draw() {
  background(255);
  ellipse(x,100,30,30);
  x += velocidad;
  
  if (x > width)
  {
    x = 0;
  }
  delay(1000);
}

/*
int x = 50;

while(x <= 400)
{
  line(x ,50, x + 50, 450);
  x+= 25;
}
*/
/*
int y = 5;

while(y < height)
{
  rect(100, y, 100, 8);
  y += 20;
}
*/
/*
int contador = 0;

background(255);

while(contador < 11)
{
  ellipse(50 + contador * 40, 100, 30,30);
  contador++;
}
*/
