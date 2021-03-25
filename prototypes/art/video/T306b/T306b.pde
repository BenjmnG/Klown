import processing.video.*;
import com.hamoid.*;

Movie video;
VideoExport videoExport;

final String sketchname = getClass().getName();

int space = 4; // Distance entre 2 lignes
int crop = 0;
int fps = 10;
float maxWeight = space*.75;
float maxDaz = space*20;
float lim255t = 66;
//int[] r = {255, 145, 0}; int[] v = {255, 0, 119}; int[] b = {60, 200, 255};

float inc = 0.06;
float fnoise = 0.0;

void setup() {
  size(1920, 1080);
  //size(3840, 2160);
  colorMode(HSB, 256);
  frameRate(fps);
  video = new Movie(this, "../../../../src/ukparl-slow.mp4");
  video.loop();
  video.play();
  //video.frameRate(fps);
  //video.speed(.25);
  video.jump(22);
  video.volume(0);

}

void draw() { 
  background(#333333);
  fill(#ffffff);
  noStroke();
  float xnoise = 0.0;
  float ynoise = 0.0;
  //println(video.time());
  //if (video.time() > 226. && video.time() < 227) {video.jump(236);}
  if (video.available()) {
    video.read();
    video.loadPixels();
    
   for (int y = crop; y < height - crop;y = y + space/(space/2)) {
      
     beginShape();
      for (int x = 0; x < width;x = x + space) {
        
        color col = video.pixels[x+y*width];
        float brightness = brightness(col);
        if(brightness > lim255t){
          float pixel = map(brightness, lim255t, 255, 0, maxWeight);
          float daz = map(brightness, lim255t, 255, 0, maxDaz); // destroy the image with dazzling param

          float n = noise(xnoise, ynoise, fnoise) * 50 ;
          fill(n, 255, 255);
          
          ellipse(x+daz, y+daz, pixel, pixel);
          xnoise += inc;
        };
        ynoise += inc;
      }
    }
    fnoise += inc;
    video.updatePixels();

  }
   //rec();
  
  fill(255);
  text("VideoTime " + video.time(), 20,40);
  text("Framecount " + frameCount,20,60);
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
