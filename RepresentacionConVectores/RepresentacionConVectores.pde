float x = 100;
float y = 100;
float xspeed = 2;


void setup()
{
  size(640,360);
  background(255);
}
void draw()
{
  x = x + xspeed;
  fill(0, 250, 215);
  strokeWeight(10);
  stroke(178, 0, 250);
  
  ellipse(x, y, 100, 100);
}
