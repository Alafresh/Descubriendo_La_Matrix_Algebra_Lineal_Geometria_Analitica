size(600, 600);
background(26, 0, 98);



// brazos
strokeWeight(5);
line(260, 320, 180, 280);
strokeWeight(5);
line(340, 320, 420, 280);



noStroke();
fill(131,131,131);
rect(0,500,600,100);
// Sombra
fill(101,101,101);
ellipse(370, 525, 150, 40);
fill(255,255,255);
ellipse(300, 450, 150, 150);
ellipse(300, 350, 100, 100);
ellipse(300, 270, 75, 75);
// sol
fill(255, 255, 0);
ellipse(10, 10, 95, 95);


// ojos
fill(0);
ellipse(285, 265, 8, 8);
fill(0);
ellipse(305, 269, 8, 13);

// botones
fill(0);
ellipse(290, 320, 12, 12);
fill(0);
ellipse(280, 350, 12, 12);
fill(0);
ellipse(290, 380, 12, 12);

//sombrero
fill(0);
ellipse(300, 240, 70, 25);
fill(0);
rect(275, 180, 50, 60);
fill(0);
ellipse(300, 180, 50, 25);
// nariz
noStroke();
fill(247, 120, 0);
triangle(295, 295, 300, 280, 270, 275);
