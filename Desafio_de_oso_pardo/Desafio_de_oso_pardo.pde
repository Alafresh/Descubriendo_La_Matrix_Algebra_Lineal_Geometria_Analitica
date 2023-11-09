
size(600,600);
background(225);

noStroke();
float x = 200;
float y = 200;
float faceSize = 160;

//Orejas
float earSize=faceSize*1/2;
fill(89, 52, 17);
ellipse(x-faceSize*2/5, y-faceSize*2/5, earSize, earSize);
ellipse(x+faceSize*2/5, y-faceSize*2/5, earSize, earSize);

//Cara
fill(163, 113, 5);
ellipse(x, y, faceSize, faceSize);

//Ojos
fill(0, 0, 0);
ellipse(160, 180, 20, 20);
ellipse(240, 180, 20, 20);

//Naríz
fill(89, 52, 20);
ellipse(x, y+faceSize/8, faceSize*4/15, faceSize/5);
