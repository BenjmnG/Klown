import processing.video.*;
import com.hamoid.*;

Movie video;
VideoExport videoExport;

final String sketchname = getClass().getName();

int space;
int crop = 1;
float minWeight = 10;

void setup() {
  size(1280, 720);
  frameRate(5);
  video = new Movie(this, "../../../../src/RapRage/hamza-reel.mp4");
  video.loop();
  space = height/10; // Distance entre 2 lignes
  video.play();
  video.speed(.25);
  video.jump(57);
  video.volume(0);
  noFill();
  
  strokeWeight(minWeight); //
}

void draw() { 
  background(#222222);
  strokeWeight(space);
  strokeCap(SQUARE);
  noFill();
  boolean black = true;
  //space = int(map(cos(frameCount/10), -1, 1, minWeight, minWeight*10));
  
  if (video.available()) {
    video.read();
    video.loadPixels();

   for (int y = crop; y < height - crop;y = y + space) {
      beginShape();
      for (int x = space / 2; x < width;x = x + 50) {
        color col = video.pixels[x + y * width];
        float brightness = brightness(col);        
        if(black){stroke(#000000);} else {stroke(#ff5032);}
        curveVertex(x, y - brightness/5);
      }
      endShape();
      black = !black;
    }

   for (int y = crop; y < height - crop;y = y + space) {
      beginShape();
      for (int x = space / 2; x < width;x = x + 50) {
        color col = video.pixels[x + y * width];
        float brightness = brightness(col);        
        if(black){stroke(#222222);} else {stroke(#ff5032);}
        curveVertex(x, y - brightness/5);
      }
      endShape();
      black = !black;
    }
   
   for (int y = crop; y < height - crop;y = y + space/50) {
      for (int x = space / 2; x < width;x = x + space/50) {
        color col = video.pixels[x + y * width];
        float brightness = brightness(col);
        if(brightness < 55){
          noStroke();
          fill(0,0,0, brightness / 2);
          rect(x,y, space/50, space/50);
        }
      }
      black = !black;
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
