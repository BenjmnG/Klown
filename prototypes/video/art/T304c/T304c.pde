import processing.video.*;
import com.hamoid.*;

Movie video;
VideoExport videoExport;

final String sketchname = getClass().getName();

int space;
int crop = 0;
int fps = 30;
float minWeight = 10;

void setup() {
  size(1280, 720);
  //size(3840, 2160);
  frameRate(fps);
  video = new Movie(this, "../../../../src/macro720.mp4");
  video.loop();
  space = 2; // Distance entre 2 lignes
  video.play();
  video.speed(0.25);
  //video.jump(220);
  video.volume(0);

}

void draw() { 
  background(#333333);
  fill(#ffffff);
  noStroke();
  //println(video.time());
  //if (video.time() > 226. && video.time() < 227) {video.jump(236);}
  if (video.available()) {
    video.read();
    video.loadPixels();
    
   for (int y = crop; y < height - crop;y = y + space/(space/2)) {
      beginShape();
      boolean open = true;
      for (int x = 0; x < width;x = x + space) {
        color col = video.pixels[x+y*width];
        float brightness = brightness(col)/255;
        //println(brightness);
        brightness = map(brightness, 0, 1, 0, minWeight);
        if(brightness > minWeight/4){
          float pixel = space/space*(brightness/4);
          float daz = brightness*2; // destroy the image with dazzling param
          ellipse(x+daz, y+daz, pixel, pixel);
        };
      }
      if(open){endShape();}
    }
    video.updatePixels();
  }
   rec();
 }
 
void mousePressed(){looping=!looping;}

void rec() {
  if (frameCount == 1) {
    videoExport = new VideoExport(this, "../../../export/processing/"+sketchname+"--"+hour()+"H"+minute()+".avi");
    videoExport.setFrameRate(fps);
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
