import processing.video.*;
import com.hamoid.*;

Movie video;
VideoExport videoExport;

final String sketchname = getClass().getName();

int space;
int crop = 0;
float minWeight = 1;
boolean bw = true;

void setup() {
  size(1280, 720);
  frameRate(24);
  video = new Movie(this, "../../../../src/Cloud-2142.mp4");
  video.loop();
  video.speed(.5);
  space = 20; // Distance entre 2 lignes
  video.play();

  noStroke();
  background(#222222);  
  strokeWeight(minWeight); //
}

void draw() { 
  background(#fc2803);
  background(#222222);
  fill(255, 255, 255);

  if (video.available()) {
    video.read();
    video.loadPixels();
    
   for (int y = crop; y < height - crop;y = y + space) {
      beginShape();
      boolean open = true;
      for (int x = space / 2; x < width;x = x + 10) {
        color col = video.pixels[x + y * width];
        float brightness = brightness(col)/255;
        strokeWeight(map(brightness, 0, 20, minWeight, minWeight*2));
        if(brightness >= .5){ellipse(x, y, space/2*brightness, space/2*brightness);};
      }
      if(open){endShape();}
    }
    video.updatePixels();
  }
   //rec();
 }
void mousePressed(){looping=!looping;}


void rec() {
  if (frameCount == 1) {
    videoExport = new VideoExport(this, "../"+sketchname+"-"+hour()+minute()+second()+".avi");
    videoExport.setFrameRate(10);
    videoExport.setQuality(100, 0);
    videoExport.startMovie();
  }
  videoExport.saveFrame();
}

void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
    videoExport.dispose();
  }
}
