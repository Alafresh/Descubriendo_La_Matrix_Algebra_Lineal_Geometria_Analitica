float angle = 0;
float orbitRadius = 150;
float planetSize = 10;
float starSize = 30;

void setup() {
  size(400, 400);
  noStroke();
  fill(255,255,0);
}

void draw() {
  background(0);
  
  // Dibujar la "estrella" central
  ellipse(width/2, height/2, starSize, starSize);
  
  // Calcular las posiciones del "planeta" en la órbita elíptica
  float planetX = width/2 + orbitRadius * cos(radians(angle));
  float planetY = height/2 + (orbitRadius / 2) * sin(radians(angle)); // Dividimos por 2 para hacer la elipse más achatada
  
  // Dibujar el "planeta" en su posición
  ellipse(planetX, planetY, planetSize, planetSize);
  
  // Incrementar el ángulo para simular el movimiento del planeta
  angle += 1;
  
  // Resetear el ángulo para evitar números grandes y mantener la precisión
  if (angle > 360) {
    angle = 0;
  }
}
