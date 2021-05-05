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
  video = new Movie(this, "../../../../src/RapRage/booba-jourdepaye.mp4");
  video.loop();
  video.volume(0);
  video.speed(.25);
  video.jump(57);
  space = 7; // Distance entre 2 lignes
  video.play();

  noStroke();
  background(#222222);  
  strokeWeight(minWeight); //
}

void draw() { 
  background(#222222);
  
  if (video.available()) {
    video.read();
    video.loadPixels();
    
   for (int y = crop; y < height - crop;y = y + space) {
      beginShape();
      boolean open = true;
      for (int x = space / 2; x < width;x = x + space) {
        color col = video.pixels[x + y * width];
        float brightness = brightness(col);
        float n = map(noise(x + frameCount,y), 0, 1, space*-1, space*1);
        fill(125 + brightness, 160 - brightness / 2, 50);
        if(brightness > 160){ellipse(x + n, y + n, brightness / 30, brightness / 30);}
        else if(brightness > 140){ ellipse(x + n, y + n, brightness / 40, brightness / 40);}
        else if(brightness > 120){ ellipse(x + n, y + n, brightness / 50, brightness /50);}
        else if(brightness > 100){ ellipse(x + n, y + n, brightness / 60, brightness / 60);}
        else if(brightness > 80){ ellipse(x + n, y + n, brightness / 70, brightness / 70);}
      }
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
