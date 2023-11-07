
//Repaso traslaciones

int xPosition = 10;
int xSpeed = 1;
void setup() {


size(800, 800);
background(#46FFE8);

noStroke();
}

void draw() {
    background(#46FFE8);
    // Cuerpo del coche
    fill(#853BFF);
    rect(xPosition + 15, 178, 70, 40);
    rect(xPosition, 200, 100, 20);

    //Llantas del coche
    fill(0);
    ellipse(xPosition + 25, 225, 20, 20);
    ellipse(xPosition + 75, 225, 20, 20);
    
    xPosition += xSpeed;
    
    if ((xPosition + 100 > width || xPosition < 0))
    {
      xSpeed = xSpeed * -1;
    }
    
}
