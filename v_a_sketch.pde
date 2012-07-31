
// For consistency, PLEASE ONLY USE PROCESSING VERSION 1.5.1. Thanks.

// consts

int WIDTH_SCR = 1024;
int HEIGHT_SCR = 720;

int NUM_COLOURS = 6;



// FRAMEWORK v0.0
//
// Matt's department. This file will change.

PrismModule _testModule;

  
void setup() {
  size(WIDTH_SCR, HEIGHT_SCR, P2D);
  background(0);
  smooth();
  
  frameRate(15);      
  // framerate we be managed, splitting cycles between up to 10 PrismModules. 
  // Expect your modules framerate to be lower than normal
  
  _testModule = new BufferSketch();
  _testModule.setMeUp();
}

void draw() {
  if (frameCount % 10 == 0) { _testModule.refreshData(); }
  
  _testModule.updateMe();
  
  background(0);
  
  _testModule.drawMe();
  image(_testModule.p, 0, 0);
  
}


// Abstract class for each PrismModule

class PrismModule {
  
  PGraphics p;
  PrismPalette palette;
  
  PrismModule() { 
    p = createGraphics(WIDTH_SCR, HEIGHT_SCR, JAVA2D);  // 2D content preferred
    palette = new PrismPalette();
  }
  
  void setMeUp() {  }
  void refreshData() {}
  void updateMe() { }
  void drawMe() {  }
  
}

  


