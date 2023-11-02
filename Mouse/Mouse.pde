void setup() {
  size(1000, 600);
}

void draw() {
  background(255);
  fill(0);
  translate(width/2, height/2);
  
  ellipse(width / 2, height / 2, 10, 10);
  PVector mouse = new PVector(mouseX, mouseY);
  PVector center = new PVector(width / 2, height / 2);
  
  mouse.sub(center);
  mouse.mult(2);
  line(0, 0, mouse.x, mouse.y);
}
