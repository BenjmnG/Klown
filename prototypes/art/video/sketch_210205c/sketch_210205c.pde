import processing.video.*;
import com.hamoid.*;

Movie video;
VideoExport videoExport;

final String sketchname = getClass().getName();

int space;
int crop = 1;
float minWeight = 1;
boolean bw = true;

void setup() {
  size(1280, 720);
  frameRate(5);
  video = new Movie(this, "../../../../src/riot.mp4");
  video.loop();
  video.volume(0);
  video.speed(.25);
  space = 10; // Distance entre 2 lignes
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
      for (int x = space / 2; x < width;x = x + space) {
        color col = video.pixels[x + y * width];
        float brightness = brightness(col);
        if(brightness > 254){ ellipse(x, y, brightness / 20, brightness / 20); }
        else if(brightness > 220){ ellipse(x, y, brightness / 30, brightness / 30); }
        else if(brightness > 180){ ellipse(x, y, brightness / 40, brightness / 40); }
        else if(brightness > 150){ ellipse(x, y, brightness / 120, brightness /120); }
      }
    }
    video.updatePixels();
  }
   rec();
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
