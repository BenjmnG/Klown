import processing.video.*;
import com.hamoid.*;

Movie video;
VideoExport videoExport;


final String sketchname = getClass().getName();

int space;
int crop = 95;
float minWeight = 10;

void setup() {
  size(1280, 720);
  frameRate(5);
  video = new Movie(this, "../../../../src/rogue.mp4");
  video.loop();
  space = 5; // Distance entre 2 lignes
  video.play();
  //video.speed(.25);
  video.jump(22);
  video.volume(0);
  background(#ffffff);
}

void draw() { 
  background(#ffffff);
  fill(#d9d9d9);
  noStroke();

  if (video.available()) {
    video.read();
    video.loadPixels();
    
   for (int y = crop; y < height - crop;y = y + space) {
      beginShape();
      boolean open = true;
      for (int x = space / 2; x < width;x = x + space) {
        color col = video.pixels[x + y * width];
        float brightness = brightness(col)/255;
        //println(brightness);
        brightness = map(brightness, 0, 1, 0, minWeight);
        strokeWeight(brightness);
        if(brightness < minWeight/4){
          ellipse(x+brightness*10, y+brightness*10, space/2*brightness, space/2*brightness);
        };
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
