/*int[] posicionesX = new int[5];
int[] posicionesY = new int[5];

void setup() 
{
  size(400,400);
  
  // Inicializar posiciones de enemigos
  
  for(int i = 0; i < 5; i++)
  {
    posicionesX[i] = (int) random(width);
    posicionesY[i] = (int) random(height);
  }
}

void draw() 
{
  background(255);
  
  // Dibujar enemigos en pantalla
  fill(255,0,0);
  for(int i = 0; i < 5; i++)
  {
    ellipse(posicionesX[i], posicionesY[i], 20 ,20);
  }
}*/
void setup() 
{
  size(400,400);

  /*for(int x = 20; x <= 380; x = x +20)
  {
    for(int y = 20; y <= 380; y += 20)
    {
      point(x,y);
    }
  } */
  /*int y = 20;
  int x = 20;
  while(x <= 380)
  {
    while(y <= 380)
    {
       point(x,y);
       y += 20;
       x += 20;
    }
       point(x,y);
       x += 20;
  }*/
  
/*for(int y = 20; y <= 380; y = y +20)
  {
    line(20, y, 380 , y);
    line(y, 20, y , 380);
  }*/
   noFill();
  for(int i = 0; i < 380; i += 20)
  {
    ellipse(200, 200, i, i);
  }
}
