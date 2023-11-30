float x = 300;
float y = 300;
float faceSize = 160;
float speed = 1;

void setup()
{
  size(600,600);
  background(225);
}

void draw()
{
  background(225);
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
  ellipse(x - faceSize*2/7, y - 20, earSize-60, earSize-60);
  ellipse(x + faceSize*2/7, y - 20, earSize-60, earSize-60);
  
  //Naríz
  fill(89, 52, 20);
  ellipse(x, y+faceSize/8, faceSize*4/15, faceSize/5);
  
  earSize += speed;
  faceSize += speed;
}
