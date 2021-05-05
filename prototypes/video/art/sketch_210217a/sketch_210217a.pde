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
  space = 10; // Distance entre 2 lignes
  video.play();
  video.speed(.25);
  video.jump(22);
  video.volume(0);
  background(#ffffff);
}

void draw() { 
  background(#ffffff);
  //space = int(map(cos(frameCount), -1, 1, minWeight, minWeight*50));
    //image(video, 0, 0);

  if (video.available()) {
    video.read();
    video.loadPixels();
    
   for (int y = crop; y < height - crop;y = y + space) {
      beginShape();
      boolean open = true;
      for (int x = space / 2; x < width;x = x + 4) {
        color col = video.pixels[x + y * width];
        float red = col >> 16 & 0xFF;
        float brightness = 0.3 * red / 255 * 100;
        //strokeWeight(map(brightness, 0, 20, minWeight, minWeight*3));
        strokeWeight(1);
        stroke(#d3d3d3);
        if((open) && (brightness <= 7)){ endShape(); open = false; }
        else if((!open) && (brightness > 7)){ beginShape(); curveVertex(x, y + brightness); open = true;}
        else if((open) && (brightness > 7)){curveVertex(x, y + brightness); }
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
