void setup() {
  size(1000, 600);
}

void draw() {
  background(255);
  fill(0);
  
  translate(width/2, height/2);
  
  //line(center.x, center.y, 340, 300);
  ellipse(width / 2, height / 2, 10, 10);
  
  PVector mouse = new PVector(mouseX, mouseY);
}
