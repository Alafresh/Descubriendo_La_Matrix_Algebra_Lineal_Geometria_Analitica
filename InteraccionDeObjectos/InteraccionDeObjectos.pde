float jugadorX = 50;
float enemigoX = 120;

void colisionarJugadorEnemigo()
{
  if(dist(jugadorX, 50, enemigoX, 50) < 25)
  {
    println("Colision detectada: Jugador y enemigo colisionaron");
  }
}

void draw()
{
  colisionarJugadorEnemigo();
}
