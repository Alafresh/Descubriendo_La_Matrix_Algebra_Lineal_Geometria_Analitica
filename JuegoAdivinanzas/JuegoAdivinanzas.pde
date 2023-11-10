// Juego de Adivinanzas

int numeroSecreto;
int intentoUsuario;

void setup()
{
  size(400,200);
  textSize(40);
  numeroSecreto = int(random(1,11)); // no incluye el 11 numero de 0 a 10
  if(intentoUsuario == numeroSecreto)
  {
    text("Adivinaste el numero", 20, 100);
  }
  else {
    text("El numero es " + numeroSecreto, 20, 100);
  }

}
