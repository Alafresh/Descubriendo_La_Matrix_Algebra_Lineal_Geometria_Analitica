float jugadorX, jugadorY;       // Posición del jugador
float velocidadY = 0;           // Velocidad vertical inicial
float gravedad = 0.4;       
float velocidadX = 3;// Valor de la gravedad
boolean enElSuelo = false;      // Bandera para verificar si el jugador está en el suelo

float plataformaX, plataformaY; // Posición de la plataforma

void setup() {
  size(800, 600);
  jugadorX = width / 2;
  jugadorY = height / 2;
  plataformaX = width / 3;
  plataformaY = height * 3 / 4;
}

void draw() {
  background(255);

  // Verificar si el jugador está en el suelo
  if (jugadorY >= height) {
    jugadorY = height;
    enElSuelo = true;
  } else {
    enElSuelo = false;
  }

  // Aplicar gravedad al jugador
  velocidadY += gravedad;
  jugadorY += velocidadY;
  

  // Limitar al jugador al área de juego
  jugadorY = constrain(jugadorY, 0, height);

  // Dibujar la plataforma
  fill(100, 150, 200);
  rect(plataformaX, plataformaY, 200, 20);

  // Verificar colisión con la plataforma
  if (jugadorX > plataformaX && jugadorX < plataformaX + 200 && jugadorY >= plataformaY) {
    jugadorY = plataformaY;
    enElSuelo = true;
  }

  // Dibujar el jugador
  fill(255, 0, 0);
  ellipse(jugadorX, jugadorY, 20, 20);
}

void keyPressed() {
  // Saltar cuando se presiona la tecla espacio y el jugador está en el suelo
  if (key == ' ' && enElSuelo) {
    velocidadY = -10;  // Cambia el valor según sea necesario
  }
  if(key == 'D' || key == 'd')
  {
     jugadorX += velocidadX;
  }
  if(key == 'A' || key == 'a')
  {
     jugadorX -= velocidadX;
  }
}
