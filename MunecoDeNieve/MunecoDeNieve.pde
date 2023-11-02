size(600, 600);
background(26, 0, 98);

rect(0,500,600,100);
ellipse(300, 450, 150, 150);
ellipse(300, 350, 100, 100);
ellipse(300, 270, 75, 75);
// sol
fill(255, 255, 0);
ellipse(10, 10, 95, 95);

// brazos
strokeWeight(5);
line(260, 320, 180, 280);
strokeWeight(5);
line(340, 320, 420, 280);

// ojos
fill(0);
ellipse(285, 265, 5, 5);
fill(0);
ellipse(305, 269, 5, 8);

// botones
fill(0);
ellipse(290, 320, 8, 8);
fill(0);
ellipse(280, 350, 8, 8);
fill(0);
ellipse(290, 380, 8, 8);

//sombrero
fill(0);
ellipse(300, 240, 60, 15);
fill(0);
rect(280, 180, 40, 60);
fill(0);
ellipse(300, 180, 40, 15);
// nariz
noStroke();
fill(247, 120, 0);
triangle(295, 295, 300, 280, 270, 275);
