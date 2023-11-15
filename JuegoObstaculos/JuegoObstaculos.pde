int jugadorX, jugadorY; 
int obstaculoX, obstaculoY;
int diametroJugador =30;
int ladoObstaculo= 40;
int vidas =3;

void setup() {
  
  size(400,400);
  jugadorX = width/2;
  jugadorY = height - 50;
  obstaculoX = width/2;
  
}

void draw() {
  background(#8307DE);
  fill(255, 0, 0);
  ellipse(jugadorX, jugadorY, diametroJugador, diametroJugador);
  
  fill(0,255,0);
  rect(obstaculoX - ladoObstaculo/2, obstaculoY, ladoObstaculo, ladoObstaculo);
  
  boolean collision = dist(jugadorX, jugadorY, obstaculoX, obstaculoY) < (diametroJugador/2 + ladoObstaculo / 2);
  
  if (keyPressed)
  {
    if(key == 'a' || key == 'A')
    {
      jugadorX -=5;
    }
    else if(key == 'd' || key == 'D')
    {
      jugadorX +=5;
    }
  }
  
  jugadorX = constrain(jugadorX, 0, width);
  
  if(collision)
  {
    vidas--;
    obstaculoX = int(random(width));
    obstaculoY = 0;
    jugadorX =width/2;
    jugadorY =height - 50;
    if(vidas <= 0)
    {
      fill(255,0,0);
      text("Perdiste so!", width/2, height/2);
      
      noLoop();
    }
  }
  obstaculoY +=10;
  
  if(obstaculoY > height)
  {
    obstaculoX = int(random(width));
    obstaculoY = 0;
  }
  fill(0);
  textSize(16);
  text("Viidas: " + vidas, 10, 20);
  
}
