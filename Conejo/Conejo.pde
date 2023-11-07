float ojos = 15;
float size = 1;
float dientesLargos = 40;

void setup () {
  size(600, 600);
  background(0,270,227);
  
  
  noStroke();
  //Orejas
  ellipse(215,235,80,200);
  ellipse(385,235,80,200);
  
  //Cara
  ellipse(300,380,250,250);
  
  //interior oreja
  fill(250,150,141);
  ellipse(215, 240, 40, 100);
  ellipse(385, 240, 40, 100);

}

void draw() {
  //Ojos
  fill(0);
  ellipse(240,350,ojos,ojos);
  ellipse(360,350,ojos,ojos);
  
  //Boca
  stroke(0);
  line(350, 425, 250,425);
  fill(255);
  rect(275,425,25,dientesLargos);
  rect(300,425,25,dientesLargos);
  
  
  if (ojos < 100.0 )
  {
     ojos = ojos + size;
  }
  if (dientesLargos < 160.0)
  {
    dientesLargos = dientesLargos + size;
  }
}
