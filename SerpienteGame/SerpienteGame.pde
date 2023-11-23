ArrayList<PVector> serpiente = new ArrayList<PVector>();
PVector pos;
int len = 0;
int frutaX, frutaY;
int tamanoSerpiente = 20;
int velocidad = 20;
int direccionX = 1;
int direccionY = 0;

void setup() {
  size(400, 400);
  pos = new PVector(width / 2, height / 2);
  colocarFruta();
}

void draw() {
  background(51);
  dibujarSerpiente();
  dibujarFruta();
  verificarColisiones();
  
  if(frameCount % velocidad == 0)
    moverSerpiente(); 

  
}

void moverSerpiente() {
  
  // Añade la posición actual de la cabeza a la cola
  serpiente.add(new PVector(pos.x, pos.y));
  
  // Mueve la cabeza
  pos.add(direccionX * tamanoSerpiente, direccionY * tamanoSerpiente);
  
  // Mantén la cola del tamaño correcto
  while (serpiente.size() > len) {
    serpiente.remove(0);
  }
  pos.add(direccionX, direccionY);
  
  if (pos.x < 0) {
    pos.x = width - tamanoSerpiente;
  } else if (pos.x >= width) {
    pos.x = 0;
  }
  
  if (pos.y < 0) {
    pos.y = height - tamanoSerpiente;
  } else if (pos.y >= height) {
    pos.y = 0;
  }

}

void dibujarSerpiente() {
  // Dibuja cada segmento de la serpiente
  for (PVector segmento : serpiente) {
    fill(255);
    rect(segmento.x, segmento.y, tamanoSerpiente, tamanoSerpiente);
  }
  // Dibuja la cabeza
  fill(255);
  rect(pos.x, pos.y, tamanoSerpiente, tamanoSerpiente);
}

void dibujarFruta() {
  fill(255, 0, 0);
  ellipse(frutaX + tamanoSerpiente / 2, frutaY + tamanoSerpiente / 2, tamanoSerpiente, tamanoSerpiente);
}

void colocarFruta() {
  frutaX = int(random(width / tamanoSerpiente)) * tamanoSerpiente;
  frutaY = int(random(height / tamanoSerpiente)) * tamanoSerpiente;
}

void verificarColisiones() {
  if (dist(pos.x, pos.y, frutaX, frutaY) < tamanoSerpiente) {
    colocarFruta();
    print(serpiente.size());
    len += 1;
  }
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
