size(1280,720);
background(0);
smooth();

PImage cloudImg;
cloudImg = loadImage("b.png");
 
int space = 12;
background(#de3012);
noFill();
stroke(255);
for (int y = space / 2; y < height;y = y + space) {
  beginShape();
  for (int x = space / 2; x < width;x = x + 4) {
    int srcSize = (int)random(space / 40, space);
    int change = (srcSize - space) / 2;
    color col = cloudImg.get(x, y);
    float brightness = (0.3 * red(col) + 0.59 * green(col) + 0.11 * blue(col)) / 255 * 100;
    //fill(col, 50);
    curveVertex(x, y + brightness);
  }
  endShape();
}
 
//if(!online)saveFrame("frame.png");
