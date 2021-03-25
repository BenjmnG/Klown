import processing.video.*;
import com.hamoid.*;

Movie video;
VideoExport videoExport;

final String sketchname = getClass().getName();

int crop = 0;
int fps = 10;
int space = 4; // Distance entre 2 lignes;
float maxWeight = space*.5;
float maxDaz = space*20;
//int[] r = {255, 145, 0}; int[] v = {255, 0, 119}; int[] b = {60, 200, 255};

void setup() {
  size(1280, 720);//size(1920, 1080);
  frameRate(fps);
  video = new Movie(this, "../../../../src/RapRage/booba-jourdepaye.mp4");
  video.loop();
  video.play();
  //video.frameRate(fps);
  video.speed(.25);
  video.jump(35);
  video.volume(0);

}

void draw() { 
  background(#333333);
  blendMode(ADD);
  noStroke();
  //println(video.time());
  //if (video.time() > 226. && video.time() < 227) {video.jump(236);}
  if (video.available()) {
    video.read();
    video.loadPixels();
    
   for (int y = crop; y < height - crop;y = y + space/space) {
      beginShape();
      boolean open = true;
      for (int x = 0; x < width;x = x + space) {
        color col = video.pixels[x+y*width];
        float brightness = brightness(col);
        if(brightness > 125){
          float pixel = map(brightness, 0, 255, 0, maxWeight);
          float daz = map(brightness, 125, 255, 0, maxDaz); // destroy the image with dazzling param
          
          boolean is = false; 
          
          int currG = (col >> 8 & 0xFF);
          int currR = (col >> 16 & 0xFF);
          int currB = (col & 0xFF);
          
          if(currG > 200){
            float dazG = map(currG, 255, 0, -daz, daz);
            fill(255, currG, 0); // Orange
            ellipse(x+daz+dazG, y+daz, pixel, pixel);
            if(!is){is = true;}
          } else if(currR > 175){
            float dazR = map(currR, 255, 0, -daz, daz);
            fill(currR, 0, 119); // Magenta
            ellipse(x+daz+dazR, y+daz, pixel, pixel);
            if(!is){is = true;} 
          } else if(currB > 155){
            float dazB = map(currB, 255, 0, -daz, daz);
            fill(60, 200, currB); // Blue
            ellipse(x+daz+dazB, y+daz, pixel, pixel);
            if(!is){is = true;}
          }
          
          // if grey
          else if(!is){
            fill(255,255,255);
            ellipse(x+daz, y+daz, pixel, pixel);            
          }
          
        };
      }
    }
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
