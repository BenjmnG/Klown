import processing.video.*;
import com.hamoid.*;

Movie video;
VideoExport videoExport;

int space;
int crop = 94;
void setup() {
  size(1280, 720);
  frameRate(24);
  video = new Movie(this, "a.mp4");
  space = 12;
  video.play();
  video.jump(20);
  noFill();
  stroke(0);
  strokeWeight(1); 
  
  //videoExport = new VideoExport(this);
  //videoExport.startMovie();
  

}

void draw() { 
  background(#fc2803);
  //image(video, 0, 0);

  if (video.available()) {
    video.read();
    video.loadPixels();
    

    for (int y = crop; y < height - crop;y = y + space) {
      beginShape();
      for (int x = space / 2; x < width;x = x + 4) {
        color col = video.pixels[x + y * width];
        float brightness = (0.3 * red(col) + 0.59 * green(col) + 0.11 * blue(col)) / 255 * 100;
        curveVertex(x, y + brightness);
      }
      endShape();
    }
    video.updatePixels();
  }
  //videoExport.saveFrame();
}

/*void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}*/
