
// For consistency, PLEASE ONLY USE PROCESSING VERSION 1.5.1. Thanks.

// COLOUR MANAGEMENT
//
// Feel free to set your own palette using this, and call getColour() from your Module

class PrismPalette {
  
  color colArr[] = new color[NUM_COLOURS];
  
  PrismPalette() {
    // randomised
    for (int i = 0; i < NUM_COLOURS; i++) {
       colArr[i] = color(random(255), random(255), random(255)); 
    }
    // or you can set your own palette, eg.
    // colArr[0] = color(150, 150, 150);
    // etc....
  }
  
  color getColour(int i) { return colArr[i]; }
  
}
