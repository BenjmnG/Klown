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
  frameRate(7);
  background(#333333);
  PFont f;
  // The font "andalemo.ttf" must be located in the 
  // current sketch's "data" directory to load successfully
  f = createFont("BebasNeue-Regular.otf", 200);
  textFont(f);
  


}

void draw() { 
   textAlign(CENTER, CENTER);
   fill(170, 10, 0);
   text("TROUBLE TROUBLE", width/2, -150 + 150 * frameCount);  

   if(frameCount == 6){
     //
     noStroke();
     fill(#333333);
     rect( width/2, 260, width/2, 150);
     fill(170, 10, 0);
     textAlign(LEFT, CENTER);
     text("DISTRACT", width/2, 300);
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
