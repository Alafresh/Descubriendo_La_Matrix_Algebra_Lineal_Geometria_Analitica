float ojos = 15;
float size = 1;

void setup () {
  size(600, 600);
  background(0,270,227);
  
  
  //Orejas
  ellipse(215,235,80,200);
  ellipse(385,235,80,200);
  
  //Cara
  ellipse(300,380,250,250);
  
  //Boca
  line(350, 425, 250,425);
  noFill();
  rect(275,425,25,40);
  rect(300,425,25,40);
}

void draw() {
    //Ojos
  fill(0);
  ellipse(260,350,ojos,ojos);
  ellipse(340,350,ojos,ojos);
  
  ojos = ojos + size;
  print("valor" + ojos);
  if (size + ojos < 100.0 )
  {
     size = 1;
  }
  else{
    size = -1;
  }
}
