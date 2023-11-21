int[] serpienteX, serpienteY;
int frutaX, frutaY;
int tamanoSerpiente = 20;
int velocidad = 1;
int direccionX = 1;
int direccionY = 0;

void setup()
{
  size(400,400);
  serpienteX = new int[width * height];
  serpienteY = new int[width * height];
  serpienteX[0] = width / 2;
  serpienteY[0] = height / 2;
  generarNuevaFruta();
  
}
void draw(){
  background(51);
  moverSerpiente();
  dibujarSerpiente();
  dibujarFruta();
  verificarColisiones();
}

void dibujarSerpiente()
{
  fill(255);
  for (int i = 0; i < tamanoSerpiente; i++) {
    rect(serpienteX[i], serpienteY[i], tamanoSerpiente, tamanoSerpiente);
  }
}

void dibujarFruta()
{
  fill(255, 0, 0);
  ellipse(frutaX, frutaY, tamanoSerpiente, tamanoSerpiente);
}

void verificarColisiones()
{
  if (dist(serpienteX[0], serpienteY[0], frutaX, frutaY) < tamanoSerpiente) {
    // La serpiente ha alcanzado la fruta
    generarNuevaFruta();
    aumentarTamanoSerpiente();
  }
}

void aumentarTamanoSerpiente() {
  tamanoSerpiente += 20;
  // Agregar nueva parte al final de la serpiente
  serpienteX[tamanoSerpiente - 1] = serpienteX[tamanoSerpiente - 2];
  serpienteY[tamanoSerpiente - 1] = serpienteY[tamanoSerpiente - 2];
}

void generarNuevaFruta() {
  frutaX = int(random(width / tamanoSerpiente)) * tamanoSerpiente;
  frutaY = int(random(height / tamanoSerpiente)) * tamanoSerpiente;
}

void moverSerpiente() {
  // Mueve todas las partes de la serpiente
  for (int i = tamanoSerpiente - 1; i > 0; i--) {
    serpienteX[i] = serpienteX[i - 1];
    serpienteY[i] = serpienteY[i - 1];
  }

  // Mueve la cabeza de la serpiente
  serpienteX[0] += velocidad * direccionX;
  serpienteY[0] += velocidad * direccionY;

  // Verifica colisiones con los bordes
  verificarColisionBordes();
  // Verifica colisiones consigo misma
  verificarColisionSerpiente();
}

void verificarColisionBordes() {
  if (serpienteX[0] < 0) {
    serpienteX[0] = width - tamanoSerpiente;
  } else if (serpienteX[0] >= width) {
    serpienteX[0] = 0;
  }

  if (serpienteY[0] < 0) {
    serpienteY[0] = height - tamanoSerpiente;
  } else if (serpienteY[0] >= height) {
    serpienteY[0] = 0;
  }
}

void verificarColisionSerpiente() {
  // Verifica si la cabeza de la serpiente colisiona con alguna otra parte
  for (int i = 1; i < tamanoSerpiente; i++) {
    if (serpienteX[0] == serpienteX[i] && serpienteY[0] == serpienteY[i]) {
      // Restablecer el juego si hay una colisión consigo misma
      reiniciarJuego();
    }
  }
}

void reiniciarJuego() {
  tamanoSerpiente = 1;
  direccionX = 1;
  direccionY = 0;
  setup(); // Vuelve a generar la fruta y la posición inicial de la serpiente
}

void keyPressed() {
  if (keyCode == UP) {
    direccionX = 0;
    direccionY = -1;
  } else if (keyCode == DOWN) {
    direccionX = 0;
    direccionY = 1;
  } else if (keyCode == LEFT) {
    direccionX = -1;
    direccionY = 0;
  } else if (keyCode == RIGHT) {
    direccionX = 1;
    direccionY = 0;
  }
}
