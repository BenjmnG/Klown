import processing.video.*;
import com.hamoid.*;

Movie video;
VideoExport videoExport;

final String sketchname = getClass().getName();

int space;
int crop = 94;
float minWeight = 1;

void setup() {
  size(1280, 720);
  frameRate(24);
  video = new Movie(this, "../../../../src/RapRage/Booba-GLAIVE-SAMPLE.mp4");
  video.loop();
  space = 2; // Distance entre 2 lignes
  video.play();
  video.jump(80);
  noFill();
  
  strokeWeight(minWeight); //
}

void draw() { 
  //background(#fc2803);
  background(#222222);
  blendMode(SCREEN);
  space = int(map(cos(frameCount), -1, 1, minWeight, minWeight*50));
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
        strokeWeight(map(brightness, 0, 20, minWeight, minWeight*3));
        stroke(255, 0, 0);
        if((open) && (brightness <= 9)){ endShape(); open = false; }
        else if((!open) && (brightness > 9)){ beginShape(); curveVertex(x, y + brightness); open = true;}
        else if((open) && (brightness > 9)){curveVertex(x, y + brightness); }
      }
      if(open){endShape();}
    }
    
    for (int y = crop; y < height - crop;y = y + space) {
      beginShape();
      boolean open = true;
      for (int x = space / 2; x < width;x = x + 4) {
        color col = video.pixels[x + y * width];
        float green = col >> 8 & 0xFF;
        float brightness = 0.3 * green / 255 * 100;
        strokeWeight(map(brightness, 0, 20, minWeight, 5));
        stroke(0, 255, 0);
        if((open) && (brightness <= 9)){ endShape(); open = false; }
        else if((!open) && (brightness > 9)){ beginShape(); curveVertex(x, y + brightness); open = true;}
        else if((open) && (brightness > 9)){curveVertex(x, y + brightness); }
      }
      if(open){endShape();}
    }
    
   for (int y = crop; y < height - crop;y = y + space) {
      beginShape();
      boolean open = true;
      for (int x = space / 2; x < width;x = x + 4) {
        color col = video.pixels[x + y * width];
        float blue = col & 0xFF;
        float brightness = 0.3 * blue / 255 * 100;
        strokeWeight(map(brightness, 0, 20, minWeight, minWeight*3));
        stroke(0, 0, 255);
        if((open) && (brightness <= 9)){ endShape(); open = false; }
        else if((!open) && (brightness > 9)){ beginShape(); curveVertex(x, y + brightness); open = true;}
        else if((open) && (brightness > 9)){curveVertex(x, y + brightness); }
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
