void setup()
{
  size(500,500);
  noStroke();
}

void mouseDragged()
{
  circle(mouseX, mouseY, 50);
}

void mouseMoved()
{
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
}
