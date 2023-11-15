float jugadorX = 200;
float jugadorY = 200;
float velocidad = 3;
int i = 0;

int cantidadObstaculos = 5;
float[] obstaculosX = new float[cantidadObstaculos];
float[] obstaculosY = new float[cantidadObstaculos];

void setup() {
  size(400, 400);

  // Inicializa posiciones aleatorias de obstáculos
  while (i < cantidadObstaculos) {
    obstaculosX[i] = random(width);
    obstaculosY[i] = random(height);
    i++;
  }
}

void draw() {
  background(#58FFAC);

  // Dibuja el jugador
  fill(#58AAFF);
  ellipse(jugadorX, jugadorY + 150, 30, 30);

  // Mueve al jugador en respuesta a las teclas
  if(keyPressed) {
    // ... (código de movimiento del jugador, similar al Ejercicio 1)
    if(key == 'a' || key == 'A')
    {
      jugadorX -= velocidad;
    }
    if(key == 'd' || key == 'D')
    {
      jugadorX += velocidad;
    }
    if(key == 'w' || key == 'W')
    {
      jugadorY -= velocidad;
    }
    if(key == 's' || key == 'S')
    {
      jugadorY += velocidad;
    }
  }

  // Dibuja y mueve los obstáculos
  int i = 0;
  while (i < cantidadObstaculos) {
    ellipse(obstaculosX[i], obstaculosY[i], 20, 20);
    obstaculosY[i] += 2; // Mueve los obstáculos hacia abajo

    // Verifica la colisión con el jugador
    float d = dist(jugadorX, jugadorY + 150, obstaculosX[i], obstaculosY[i]);
    if (d < 25) {
      // ¡Colisión detectada!
      textSize(32);
      fill(255, 0, 0);
      text("¡Perdiste!", width/2 - 50, height/2);
      noLoop(); // Detén el bucle draw cuando hay una colisión
    }

    // Genera nuevos obstáculos cuando los anteriores salen de la pantalla
    if (obstaculosY[i] > height) {
      obstaculosX[i] = random(width);
      obstaculosY[i] = 0;
    }

    i++;
  }
}
