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
  frameRate(15);
  video = new Movie(this, "../../../../src/RapRage/pnl-deuxfrere.mp4");
  video.loop();
  space = 1; // Distance entre 2 lignes
  video.play();
  video.speed(.5);
  video.jump(75);
  video.volume(0);
}

void draw() { 
  background(#222222);
  if (video.available()) {
    video.read();
    video.loadPixels();
    int len = video.pixels.length;
    loadPixels();

    for (int y = crop; y < height - crop;y = y + space) {
      for (int x = space / 2; x < width;x = x + space) {
         int i = x + y * video.width; // i = index of grid columns
         float n = warp(x, y, .005, 1000 + frameCount*10); 
         int offset = (i-int(n)); //%len; // with a modulo the offset should wrap around 
         if (offset<0){offset = 0; }
         color c;
         if(noise(x*y) < .75){
           c = video.pixels[offset]; // --> ArrayIndexOutOfBoundsException           
         } else{
           c = video.pixels[x + y * width];
         }
         pixels[i] = color(brightness(c), 0, 0);
      }
    }
    updatePixels();
    video.updatePixels();
  }
  rec();
 }
 
        
float warp(int _x, int _y, float factor, int n_range) {
    float n1 = noise((_x+0.0) * factor, (_y+0.0) * factor) * n_range;
    float n2 = noise((_x+5.2) * factor, (_y+1.3) * factor) * n_range;
    PVector q = new PVector(n1, n2);
            
    float n3 = noise(((_x + q.x * 4) + 1.7) * factor, ((_y + q.y * 4) + 9.2) * factor) * n_range;
    float n4 = noise(((_x + q.x * 4) + 8.3) * factor, ((_y + q.y * 4) + 2.8) * factor) * n_range;
    PVector r = new PVector(n3, n4);
                
    return noise((_x + r.x * 4) * factor, (_y + r.y * 4) * factor) * n_range;
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
