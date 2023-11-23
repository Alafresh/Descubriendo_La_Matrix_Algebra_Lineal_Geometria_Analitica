// cola de serpiente
ArrayList<PVector> serpiente = new ArrayList<PVector>();
// cabeza de serpiente
PVector pos;
// tamano de cola
int len = 0;
// recolectabe
int frutaX, frutaY;
// ancho y largo de cada cuadrito que conforma la serpiente
int tamanoSerpiente = 20;
// velovidad de movimiento serpiente
int velocidad = 20;
// direccion de la serpiente
int direccionX = 1;
int direccionY = 0;

// configuracion de lienzo
void setup() {
  // tamano del lienzo
  size(400, 400);
  // inicialisamos la cabeza en la mitad de la pantalla
  pos = new PVector(width / 2, height / 2);
  // ponemos fruta en posicion al azar
  colocarFruta();
}

// funcion que se llama continuamente para pintar el lienzo
void draw() {
  background(51);
  
  dibujarSerpiente();
  dibujarFruta();
  verificarColisiones();
  
  if(frameCount % velocidad == 0)
    moverSerpiente(); 

  
}

void moverSerpiente() {
  
  // Añade la posición actual de la cabeza de la serpiente a la lista 'serpiente'.
  // Esto guarda la posición actual antes de que la serpiente se mueva.
  serpiente.add(new PVector(pos.x, pos.y));
  
  // Mueve la cabeza de la serpiente. La dirección se multiplica por 'tamanoSerpiente'
  // para asegurar que la cabeza se mueva en incrementos del tamaño de un segmento.
  pos.add(direccionX * tamanoSerpiente, direccionY * tamanoSerpiente);
  
  // Elimina los segmentos más antiguos de la cola para mantener su tamaño correcto.
  // La lista 'serpiente' solo debe tener un número de elementos igual a 'len'.
  // Si es más larga, se eliminan los elementos más antiguos.
  while (serpiente.size() > len) {
    serpiente.remove(0);
  }
  
  // Comprueba si la cabeza de la serpiente ha salido de los límites de la ventana.
  // Si es así, la hace aparecer por el lado opuesto para crear un efecto de "pantalla envolvente".
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
  // Dibuja cada segmento de la cola de la serpiente.
  // Itera sobre la lista 'serpiente' y dibuja un rectángulo para cada segmento.
  for (PVector segmento : serpiente) {
    fill(255);
    rect(segmento.x, segmento.y, tamanoSerpiente, tamanoSerpiente);
  }
  // Dibuja la cabeza de la serpiente.
  // Después de dibujar la cola, dibuja la cabeza en la posición actual 'pos'.
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
