// Verificacion de un numero positivo o negativo
int numero = 5;

void setup()
{
  size(400, 200);
  textSize(40);
  if(numero > 0)
  {   
    text("El numero es positivo", 20,100);
  }
  else if(numero < 0)
  {
    text("El numero es negativo", 20,100);
  }
  else
  {
    text("El numero es cero", 20,100);
  }
}
