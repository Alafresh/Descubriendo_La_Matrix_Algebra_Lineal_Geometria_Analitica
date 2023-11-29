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
  background(#a6c3ff);
  
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
    fill(#22ba00);
    rect(segmento.x, segmento.y, tamanoSerpiente, tamanoSerpiente);
  }
  // Dibuja la cabeza de la serpiente.
  // Después de dibujar la cola, dibuja la cabeza en la posición actual 'pos'.
  fill(#22ba00);
  rect(pos.x, pos.y, tamanoSerpiente, tamanoSerpiente);
}

void dibujarFruta() {
  fill(#FF6100);
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

/*
boolean gameover = false;
float tamano = 20;
int velocidad = 3;

// Arreglo de objectos.
ArrayList<PVector> serpientePosicion = new ArrayList<PVector>();
// vector 2d o 3d
PVector serpienteDireccion = new PVector(1, 0);
// Objectivo
PVector frutaPosicion = new PVector(0,0);

// Consiguracion Inicial
void setup()
{
  size(400,400);
  frameRate(25);
  Reiniciar();
}

// Funcion que se llama continuamente hasta que se acabe la aplicacion
void draw()
{
  // Fondo de pantalla negro
  background(51);

  // Si es fin del juego
  if (gameover) {
    // Espera 5 segundos
    delay(5000);
    // Reinicia el juego   
    Reiniciar();
  }

  // Dibuja los puntos blanco
  fill(255);
  text("Puntos: " + (serpientePosicion.size()), 10, 20);



  fill(255, 0, 0);
  // Dibuja la fruta
  ellipse(frutaPosicion.x, frutaPosicion.y, tamano, tamano);

  // Dibuja la serpiente
  for (int i = serpientePosicion.size() -1; i > -1; i--) {

      // Obtiene la posicion actual
      PVector posicionTemporal = serpientePosicion.get(i);

      if (i == 0) {
        // Mover hacia la direccion
        posicionTemporal.x += serpienteDireccion.x * velocidad;
        posicionTemporal.y += serpienteDireccion.y * velocidad;

        // Chekea si esta por fuera de los bordes Horizontales
        if (posicionTemporal.x < 0)
        {
          posicionTemporal.x = width;
        }
        else if (posicionTemporal.x > width)
        {
          posicionTemporal.x = 0;
        }

        // Chekea si esta por fuera de los bordes Verticales
        if (posicionTemporal.y < 0)
        {
          posicionTemporal.y = height;
        }
        else if (posicionTemporal.y > height) 
        {
          posicionTemporal.y = 0;  
        }

        // checkear colision cabeza con la fruta
        if(Colision(posicionTemporal, frutaPosicion))
        {
          // crea posicion aleatoria de la fruta
          Aleatorio(frutaPosicion, 0, width-tamano);
          // incrementa la cola de la serpiente
          PVector ultimo = serpientePosicion.get(serpientePosicion.size() - 1);
          PVector siguiente = new PVector(ultimo.x-(serpienteDireccion.x * tamano * velocidad), ultimo.y-(serpienteDireccion.x * tamano *velocidad));
          serpientePosicion.add(siguiente);
        }
      } else {
        // Checkea si la cola sobrepone la cabeza
        if (i > 1 && Colision(posicionTemporal, serpientePosicion.get(0))) {          
          GameOver();
          break;
        }
        else {
        // Obtiene la posicion anterior
        PVector posicionAnterior = serpientePosicion.get(i - 1);         
        // Mueve la posicion de los objetos actuales al siguiente
        posicionTemporal.x = posicionAnterior.x + 20;
        posicionTemporal.y = posicionAnterior.y + 20;
        }
      }
       // Set snake and objective 
      // fill and stroke color 
      fill(255);
      // Display the point
      rect(posicionTemporal.x, posicionTemporal.y, tamano, tamano);
   }
}
// Funcion para checkear colision
boolean Colision(PVector p1, PVector p2)
{
  PVector c1 = new PVector(p1.x + tamano/2, p1.y + tamano/2);
  PVector c2 = new PVector(p2.x + tamano/2, p2.y + tamano/2);
  return PVector.dist(c1, c2) < tamano;
}
// Funcion aleactoria 
void Aleatorio(PVector posicion, float a, float z)
{
  posicion.x = random(a, z);
  posicion.y = random(a, z);
}
// Fin Del Juego
void GameOver() {
  gameover = true;

  // Fondo de pantalla negro
  background(0);
  // Color blanco
  fill(255);
  // Mostrar Texto fin del juego
  text("Gameover", 10, 20); 
}
// Reiniciar juego
void  Reiniciar() {
  gameover = false;

  // Elimina las posiciones de la serpiente
  serpientePosicion.clear();

  // Get screen center position
  PVector cabezaSerpiente = new PVector(width/2, height/2);

  // Agrega cabeza serpiente
  serpientePosicion.add(cabezaSerpiente);

  // Crear un numero aleatorio para la fruta
  Aleatorio(frutaPosicion, 0, width-tamano); 

}
void keyPressed() {
  if (keyCode == UP) {
    serpienteDireccion.x = 0;
    serpienteDireccion.y = -1;
  } else if (keyCode == DOWN) {
    serpienteDireccion.x = 0;
    serpienteDireccion.y = 1;
  } else if (keyCode == LEFT) {
    serpienteDireccion.x = -1;
    serpienteDireccion.y = 0;
  } else if (keyCode == RIGHT) {
    serpienteDireccion.x = 1;
    serpienteDireccion.y = 0;
  }
}
*/
int nada;
/*
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
*/
