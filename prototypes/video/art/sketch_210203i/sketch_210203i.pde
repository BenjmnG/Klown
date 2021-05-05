import processing.video.*;
import com.hamoid.*;

Movie video;
VideoExport videoExport;

final String sketchname = getClass().getName();

int space;
int crop = 94;
void setup() {
  size(1280, 720);
  frameRate(24);
  video = new Movie(this, "../../../../src/RapRage/booba-jourdepaye.mp4");
  space = 2;
  video.play();
  video.jump(80);
  noFill();
  
  strokeWeight(1);
}

void draw() { 
  //background(#fc2803);
  background(#222222);
  blendMode(DIFFERENCE );
  //image(video, 0, 0);

  if (video.available()) {
    video.read();
    video.loadPixels();
    
    stroke(255, 0, 0);
    for (int y = crop; y < height - crop;y = y + space) {
      beginShape();
      boolean open = true;
      for (int x = space / 2; x < width;x = x + 4) {
        color col = video.pixels[x + y * width];
        float brightness = (0.6 * red(col) ) / 255 * 100;
        strokeWeight(brightness/4);
        if((open) && (brightness <= 12)){ endShape(); open = false; }
        else if((!open) && (brightness > 12)){ beginShape(); curveVertex(x, y + brightness); open = true;}
        else if((open) && (brightness > 12)){curveVertex(x, y + brightness); }
      }
      if(open){endShape();}
    }  
    
    stroke(0, 255, 0);
    for (int y = crop; y < height - crop;y = y + space) {
      beginShape();
      boolean open = true;
      for (int x = space / 2; x < width;x = x + 4) {
        color col = video.pixels[x + y * width];
        float brightness = 0.6 * green(col) / 255 * 100;
        strokeWeight(brightness/4);
        if((open) && (brightness <= 12)){ endShape(); open = false; }
        else if((!open) && (brightness > 12)){ beginShape(); curveVertex(x, y + brightness); open = true;}
        else if((open) && (brightness > 12)){curveVertex(x, y + brightness); }
      }
      if(open){endShape();}
    }
    
    stroke(0, 0, 255);
    for (int y = crop; y < height - crop;y = y + space) {
      beginShape();
      boolean open = true;
      for (int x = space / 2; x < width;x = x + 4) {
        color col = video.pixels[x + y * width];
        float brightness = 0.6 * blue(col) / 255 * 100;
        strokeWeight(brightness/4);
        if((open) && (brightness <= 12)){ endShape(); open = false; }
        else if((!open) && (brightness > 12)){ beginShape(); curveVertex(x, y + brightness); open = true;}
        else if((open) && (brightness > 12)){curveVertex(x, y + brightness); }
      }
      if(open){endShape();}
    }
  
    video.updatePixels();
  }
   rec();
 }


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
  }
}
