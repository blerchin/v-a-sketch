// V&A folks will be doing some buffering of data on their own... but we don't know how. 
// So we are buffering n most recent changes.

// Data at position n of several instances of BufferedPrismData will NOT necessarily correspond.
// We can include several columns of data to mimic this functionality,
// but it may decrease performance and will make the interface more complicated.

class BufferedPrismData {
  String moduleName;
  String element;
  int bufferDepth;
  boolean checkDupes;
  
  PrismData pd; 

  ArrayList<String[]> data; //Yeah we are doing ArrayLists of arrays. Lessee how this runs...

  
  BufferedPrismData( String modName, String theElement, int depth, boolean checkDuplicates ) {
    moduleName = modName;
    element = theElement;
    bufferDepth = depth;
    checkDupes = checkDuplicates;
  
    data = new ArrayList<String[]>();
  
    pd = new PrismData( moduleName );
    
    refreshData();
  
  }
  
  int bufferSize() {
     return data.size();
  }
  
  void refreshData() {
   pd.refreshData();
   String[] elementData = getElementDataAsArray( pd.csv, element);
   data.add( elementData );
    
  }
  
  String[] latest() {
    return data.get( data.size() - 1 );
  }
  
  // Adding a function to get an element as array, for easier implementation of a buffering mechanism.
// This could also be implemented within the buffered object, so long as PrismData provides access
// to csv. -BL  
  String[] getElementDataAsArray( String[][] csv, String element ) {
   int elementAddress; 
   String[] elementData = new String[csv.length];   
    
   elementAddress = getElementAddress( csv, element );
   
        for( int i = 0; i < csv.length; i++) {
          if( isNotNullAndEmpty( csv[i][elementAddress]) ) {
             elementData[i] = csv[i][elementAddress];
            } else { 
             elementData[i] = ""; 
           }
        }
    
    return elementData;
  }
  
  
  int getElementAddress( String[][] data , String element ) {
    int elementAddress = -1;
    
    for( int i = 0; i < data[0].length; i++) {
       if( element.compareTo( data[1][i]) == 0 ) {
         elementAddress = i;
        } 
      }
    return elementAddress;
    }
  
}
