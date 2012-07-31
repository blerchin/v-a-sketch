// Buffer Sketch

// AUTHOR: Ben Lerchin
// TITLE: Buffering Sketch v0.1


class BufferSketch extends PrismModule {

 //declare variables here if you want scope to be outside setup/draw
 
 int counter;
 
 BufferedPrismData bpd;
 
 BufferSketch() {
   super();

   
 }

 
 void setMeUp() {
   bpd = new BufferedPrismData("roadsigns", "message_1", 100, false);
   bpd.refreshData();

   counter = 0;
   
   p.beginDraw();
   p.smooth();
   p.endDraw();

 }
 void drawMe() {
   String[] message = bpd.latest();
   
   if ( counter < ( message.length -1  ) ) {
     counter++;
   } else {
     counter = 0;
   }
   
   p.beginDraw();
   p.fill(0);
   p.noStroke();
   p.background(0);
   
   p.fill(255);
   p.stroke(255);
   p.text( message[counter] , 30, 30 );

   
   p.endDraw();
   
 }

 /*  
   String[] removeNullValues ( String[] source ) {
     for ( i = 0; i < source.length; 
     
   }*/
}
