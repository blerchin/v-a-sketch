
// For consistency, PLEASE ONLY USE PROCESSING VERSION 1.5.1. Thanks.

// YOUR MODULE

// leave comments in the code to identify your work, thanks
// AUTHOR: Gen
// TITLE: Radiation Tide v0.1


class RadiationTide extends PrismModule {
  
  PrismData data;
  float value, new_value, max_value;
  float posY, posX;
  
  RadiationTide() {     // initialisation
    super(); 
  }    
  
  void setMeUp() {      // setup() equivalent
    data = new PrismData("radiation");
    max_value = 0;
    refreshData();
    value = new_value;
    
    // A PGraphics instance called "p" is set up in the parent class, to buffer the drawing.
    // Make sure all drawing is done to "p", not the global Processing sketch.
    // This will keep the module nicely self-contained.
    // With PGraphics you need to call beginDraw() and endDraw() whenever you address it.
    // http://processing.org/reference/PGraphics.html
    
    p.beginDraw();
    p.smooth();
    p.endDraw();
  }
  
  void refreshData() {  // may be called at different intervals, not every frame
    data.refreshData();
    new_value = data.getDataFloat(2, 5);
    if (new_value > max_value) { max_value = new_value; }
  }
  
  void updateMe() {     // called before drawMe() every frame - if you like to separate out updating and drawing 
    if (value < new_value) {
      value += (new_value - value) / 10;
    } else if (value > new_value) {
      value -= (value - new_value) / 10;
    }
    float value_ratio = value/max_value;
    posY = HEIGHT_SCR - (HEIGHT_SCR * value_ratio);
    
    posX = noise(float(frameCount) / 1000.0) * WIDTH_SCR;
  }  
  
  void drawMe() {       // draw() equivalent
    p.beginDraw();
    p.background(0);
    
    p.noStroke();
    p.fill(palette.getColour(3));      // please use the palette for all colour assignment
    p.rect(0, posY, WIDTH_SCR, HEIGHT_SCR - posY);
    
    p.stroke(palette.getColour(0));      
    p.strokeWeight(5);
    p.fill(palette.getColour(2));
    p.ellipse(posX, posY, 40, 40);
    
    p.endDraw();
  }
  
  
  
  
}
