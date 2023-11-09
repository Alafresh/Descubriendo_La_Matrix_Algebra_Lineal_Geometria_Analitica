
// Propiedades de las elipses
float ellipse1X, ellipse1Y; // Coordenadas de la elipse 1
float ellipse2X, ellipse2Y; // Coordenadas de la elipse 2
float ellipse1Size = 50; // Tamaño de la elipse 1
float ellipse2Size = 60; // Tamaño de la elipse 2

void setup() {
  size(400, 400);
  // Posiciones iniciales de las elipses
  ellipse1X = width / 2 - 50;
  ellipse1Y = height / 2;
  ellipse2X = width / 2 + 50;
  ellipse2Y = height / 2;
}

void draw() {
  background(225);
  
  // Dibujar elipse 1
  fill(255, 0, 0);
  ellipse(ellipse1X, ellipse1Y, ellipse1Size, ellipse1Size);
  
  // Dibujar elipse 2
  fill(0, 0, 255);
  ellipse(ellipse2X, ellipse2Y, ellipse2Size, ellipse2Size);
  
  // Calcular distancia entre los centros de las elipses
  float distanceBetweenEllipses = dist(ellipse1X, ellipse1Y, ellipse2X, ellipse2Y);
  
  // Suma de los radios de las elipses
  float sumOfRadii = ellipse1Size / 2 + ellipse2Size / 2;
  
  // Detectar colisión
  if (distanceBetweenEllipses < sumOfRadii) {
    // Colisión detectada
    fill(0);
    text("Colisión detectada", width/2 - 60, height - 20);
  }
}

void keyPressed() {
  // Movimiento de las elipses con teclas de flecha
  if (keyCode == UP) {
    ellipse1Y -= 5;
  } else if (keyCode == DOWN) {
    ellipse1Y += 5;
  } else if (keyCode == LEFT) {
    ellipse1X -= 5;
  } else if (keyCode == RIGHT) {
    ellipse1X += 5;
  }
  
  if (key == 'w' || key == 'W') {
    ellipse2Y -= 5;
  } else if (key == 's' || key == 'S') {
    ellipse2Y += 5;
  } else if (key == 'a' || key == 'A') {
    ellipse2X -= 5;
  } else if (key == 'd' || key == 'D') {
    ellipse2X += 5;
  }
}
