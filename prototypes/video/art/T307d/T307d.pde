import processing.video.*;
import com.hamoid.*;

Movie video;
VideoExport videoExport;

final String sketchname = getClass().getName();

int space = 6; // Distance entre 2 lignes
int crop = 0;
int fps = 10;
float maxWeight = space*1;
float maxDaz = space*4;
float lim255t = 45;
//int[] r = {255, 145, 0}; int[] v = {255, 0, 119}; int[] b = {60, 200, 255};

void setup() {
  size(1920, 1080);
  //size(3840, 2160);
  colorMode(HSB, 256, 100, 100);
  frameRate(fps);
  video = new Movie(this, "../../../../src/ukparl-slow.mp4");
  video.loop();
  video.play();
  //video.frameRate(fps);
  //video.speed(.25);
  video.jump(25);
  video.volume(0);

}

void draw() { 
  background(#333333);
  noStroke();
  //println(video.time());
  //if (video.time() > 226. && video.time() < 227) {video.jump(236);}
  if (video.available()) {
    video.read();
    video.loadPixels();    
    drawdot(); filter(BLUR, 6);
    drawdot();
    video.updatePixels();

  }
   //rec();
  
  fill(255);
  text("VideoTime " + video.time(), 20,40);
  text("Framecount " + frameCount,20,60);
 }
 
 void drawdot(){
  for (int y = crop; y < height - crop;y = y + 2) {
    for (int x = 0; x < width;x = x + space) { 
      color col = video.pixels[x+y*width];
      float brightness = brightness(col);
      if(brightness > lim255t){
        float pixel = map(brightness, lim255t, 255, 1, maxWeight);
        float daz = map(brightness, lim255t, 100, maxDaz, 0); // destroy the image with dazzling param
        fill(map(brightness, lim255t, 100, 210, 250), 80, 100);
        ellipse(x+daz, y, pixel, pixel);
        
        fill(map(brightness, lim255t, 100, 100, 215), 80, 100);
        ellipse(x-daz, y, pixel, pixel);
        
        if(brightness > lim255t*2){
          fill(map(brightness, lim255t, 100, 20, 30), 80, brightness + 20);
          ellipse(x, y, pixel, pixel);
        }
      }
    }
  }
} 
 
void mousePressed(){looping=!looping;}

void rec() {
  if (frameCount == 1) {
    videoExport = new VideoExport(this, "../../../export/processing/"+sketchname+"--"+hour()+"H"+minute()+".avi");
    videoExport.setFrameRate(fps/4);
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