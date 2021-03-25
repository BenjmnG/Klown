import processing.video.*;
import com.hamoid.*;

Movie video;
VideoExport videoExport;

final String sketchname = getClass().getName();

int space = 4; // Distance entre 2 lignes
int crop = 0;
int fps = 50;
float maxWeight = space*2; //1.5
float maxDaz = space*10;
float lim1t = 15; // seuil de luminosité à partir duquel image restranscrite
float unlim1ted = 100 - lim1t; // plage de luminosité restante
float frameIndex = 0;
float startAt = 0;
float endAt; 
float last;
PImage frame;

float hue, 
      sat = 0,
      bri = 100, 
      var = 10;
boolean bg = true;

void setup() {
  size(1280, 720);
  //size(3840, 2160);
  colorMode(HSB, 256, 100, 100);
  noStroke();
  frameRate(fps);
  video = new Movie(this, "../../../../src/ig.mp4");
  video.volume(0);
  video.pause();
  
  endAt = video.duration() * fps;

}

void draw() { 

  //if(frameCount%2 == 0){ bg = !bg;}
  //if(bg){background(#333333);} else {background(#111111);}
  background(5, 80, 100);
  //println(video.time());
  //if (video.time() > 226. && video.time() < 227) {video.jump(236);}
  video.play();
  video.jump( new Float(round( (startAt + frameIndex / fps) * 100)) / 100 );
  video.read();
  video.pause();
  video.loadPixels();
  frameIndex = frameIndex + 1;
  //image(video, 0, 0);
  
  frame = video.get(0, 0, width, height);
  frame.loadPixels();

  /*if(frameIndex > 30 && frameIndex < 45){
    maxDaz = maxDaz + space*12; 
    sat = map(frameCount, 30, 45, 0, 80);
  } else { 
    maxDaz = space * 10; 
    sat = 0;
  }*/
  
    
  push();
  blendMode(BLEND); //LIGHTEST / REPLACE
  drawdot(); filter(BLUR, 6);
  drawdot();
  pop();
  
  push();fill(255); text("VideoTime " + video.time(), 20,40); text("Framecount " + frameCount,20,60); pop();
  
  if(frameIndex > endAt){frameIndex = 0;} 
  
  //rec();
  //saveFrame("frames/####.png");
 }
 
 void drawdot(){
  for (int y = crop; y < height - crop;y = y + 2) {
    for (int x = 0; x < width;x = x + space) { 
      color col = frame.pixels[x+y*width];
      float brightness = brightness(col);
      if(brightness > lim1t){
        float pixel = map(brightness, lim1t, 255, 0, maxWeight);
        float daz = map(brightness, lim1t, 100, maxDaz, 0); // destroy the image with dazzling param
        
        // Gray to colors method
        /*if(brightness > lim1t + unlim1ted / 4 * 2 + 10){ hue = 15;
        } else if(brightness > lim1t + unlim1ted / 4){hue = 5;
        } else{ hue = 144; var = 30;}*/
        
        hue = map(brightness, lim1t, 100, hue - var, hue + var);
        
        fill(hue, sat, bri);
        ellipse(x-daz/2+daz, y, pixel, pixel);        
        
          
        // RGB 
        /*int currR = (col >> 16 & 0xFF);
        int currG = (col >> 8 & 0xFF);          
        int currB = (col & 0xFF);
          
        if(currR > lim1t){
          fill(map(currR, lim1t, 255, 0, 30), 80, 100);
          ellipse(x + daz + space/9 * -brightness, y + daz, pixel, pixel);
        }      
        if(currG > lim1t){
          fill(map(currG, lim1t, 255, 200, 230), 80, 100);
          ellipse(x + daz, y + daz, pixel, pixel);
        }          
        if(currB > lim1t){
          fill(map(currB, lim1t, 255, 130, 160), 80, 100);
          ellipse(x + daz - space/9 * -brightness, y + daz, pixel, pixel);
        }*/
      }
    }
  }
} 
 
void mousePressed(){looping=!looping;}

void rec() {
  if (frameCount == 1) {
    videoExport = new VideoExport(this, "../../../export/processing/"+sketchname+"--"+hour()+"H"+minute()+".mp4");
    videoExport.setFrameRate(fps);
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
