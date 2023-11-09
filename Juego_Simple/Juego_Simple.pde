// Propiedades del jugador
float playerX, playerY; // Coordenadas del jugador
float playerSize = 20; // Tamaño del jugador

// Propiedades del obstáculo
float obstacleX, obstacleY; // Coordenadas del obstáculo
float obstacleSize = 30; // Tamaño del obstáculo
float obstacleSpeed = 2; // Velocidad de movimiento del obstáculo

void setup() {
  size(400, 400);
  playerX = width/2;
  playerY = height - 30;
  obstacleX = random(width);
  obstacleY = 0;
}

void draw() {
  background(255);
  
  // Dibujar al jugador
  fill(0, 255, 0);
  ellipse(playerX, playerY, playerSize, playerSize);
  
  // Mover el obstáculo
  obstacleY += obstacleSpeed;
  
  // Si el obstáculo sale de la pantalla, reiniciar su posición
  if (obstacleY > height) {
    obstacleY = 0;
    obstacleX = random(width);
  }
  
  // Dibujar el obstáculo
  fill(255, 0, 0);
  ellipse(obstacleX, obstacleY, obstacleSize, obstacleSize);
  
  // Verificar colisión entre el jugador y el obstáculo
  float distance = dist(playerX, playerY, obstacleX, obstacleY);
  if (distance < playerSize / 2 + obstacleSize / 2) {
    // Colisión detectada, juego terminado
    textSize(20);
    fill(0);
    text("¡Juego terminado!", width/2 - 100, height/2);
    noLoop(); // Detener el juego
  }
}

void keyPressed() {
  // Mover al jugador con las teclas de flecha
  if (keyCode == LEFT && playerX > playerSize / 2) {
    playerX -= 5;
  } else if (keyCode == RIGHT && playerX < width - playerSize / 2) {
    playerX += 5;
  }
}
