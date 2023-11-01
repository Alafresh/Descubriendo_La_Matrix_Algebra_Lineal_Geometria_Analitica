void setup() {
  size(1000, 600);
}

void draw() {
  background(255);
  fill(0);
  ellipse(width / 2, height / 2, 100, 100);
  PVector center = new PVector(width/2, height/2);
  line(center.x, center.y, 340, 300);
}
