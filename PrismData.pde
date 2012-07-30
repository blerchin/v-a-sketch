
// For consistency, PLEASE ONLY USE PROCESSING VERSION 1.5.1. Thanks.

class PrismData {
  
  // thanks to Gen for this.
  
  // data will be buffered to local text files in the final version, so this will change...
  
  // you may have to adapt this for other streams, haven't really looked at the data yet
  
  String module_name;
  String [] data;
  String [][] csv;
  
  int num_columns = 0;
  
  PrismData(String mod_name) {
    module_name = mod_name;
    refreshData();
  }
  
  void refreshData() {
    String [] data = loadStrings("http://citydashboard.org/modules/" + module_name + ".php?city=london&format=csv");
    
    //calculate max width of csv file
    for (int i=0; i < data.length; i++) {
      String [] chars = split(data[i], ',');
      if (chars.length > num_columns) {
        num_columns = chars.length;
      }
    }
    
    //create csv array based on # of rows and columns in csv file
    csv = new String [data.length][num_columns];
    //parse values into 2d array
    for (int i=0; i < data.length; i++) {
      String [] temp =  split(data[i], ',');
      for (int j = 0; j < temp.length; j++) {
        csv[i][j] = temp[j];
      }
    }
  }
  
  String getData(int row, int column) {
    return csv[row][column];
  }
  
  float getDataFloat(int row, int column) {
    return float(getData(row, column));
  }

}

/*

Information from Ollie at CityDashboard on accessing feeds:


(1) Finding the cities available
The list of cities available can be found at:
http://citydashboard.org/cities.txt
The city name is the first bit of each line, before the first comma on
that line. Ignore lines starting with #.

(2) Finding the modules available for each city
The list of modules available for london can be found at:
http://citydashboard.org/cities/london.txt
The module name is the first bit of each line, before the first comma
on that line. Ignore lines starting with #.

(3) Getting the data for each module

The data for each module can be found at (for example, weather_cr):
http://citydashboard.org/modules/weather_cr.php?city=london&format=csv

More generically:
http://citydashboard.org/modules/[module_name].php?city=[city_name]&format=[csv|html|blob]

You should substitute weather_cr with the module you are interested in.
The first line in each CSV file contains a number in the second field.
This is the number of seconds between each update. i.e if this is 5,
then the file won't update more than once every 5 seconds.
Modules which have a CSV feed for them, have an "m" included in the
sixth field in the appropriate row in the london.txt file - this can
read d, b, m, db, dbm etc. I can add in CSV feeds for the missing ones
that you need - there are quite a few I'm afraid. The missing ones
will just return a blank page.

*/
