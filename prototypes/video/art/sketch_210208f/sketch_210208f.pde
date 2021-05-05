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
  video = new Movie(this, "../../../../src/RapRage/booba-jourdepaye.mp4");
  video.loop();
  space = 2; // Distance entre 2 lignes
  video.play();
  video.speed(.25);
  video.jump(47);
  video.volume(0);
  
}

void draw() { 
  background(#222222);
  float d;
  //space = int(map(cos(frameCount/10), -1, 1, minWeight, minWeight*10));
  
  if (video.available()) {
    video.read();
    video.loadPixels();

   for (int y = crop; y < height - crop;y = y + space) {

      for (int x = space / 2; x < width;x = x + space) {
        color col = video.pixels[x + y * width];
        float brightness = brightness(col);
        float n = noise(x, y * frameCount);        
        if(n > .75 ){
          d = cos(y) * 10 ;          
        } else{ 
          d = 0;
        }
        
        fill(brightness,brightness,brightness);
        rect(x + d, y, space, space);
        /*if(n < .5 ){         
          for(int z = 0; z < n * d; z++){
            println(z);
            fill(255, 0, 0);//n * 10 + z * 10
            rect(x - z , y, space, space);
          }
        }*/
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
