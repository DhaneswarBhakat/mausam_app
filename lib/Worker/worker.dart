//class - different,method
//instance - different data;
import 'package:http/http.dart';
import 'dart:convert';

class worker {
  late String location;
  worker({required this.location}) {
    location = this.location;
  }

  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;

  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=a81933865f640accec828cb65f8eec1b"));
      Map data = jsonDecode(response.body);

      //Getting Temp,Humidity
      Map temp_data = data['main'];
      int getHumidity = temp_data['humidity'];
      double getTemp = temp_data['temp'];

      //Getting Wind Speed
      Map wind = data['wind'];
      double getAir_speed = wind['speed'];

      //Getting Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data['description'];

      //Assigning Values
      temp = getTemp.toString();
      humidity = getHumidity.toString();
      air_speed = getAir_speed.toString();
      description = getDesc;
      main = getMain_des;
    } catch (e) {
      temp = "Error Occured!";
      humidity = "Error Occured!";
      air_speed = "Error Occured!";
      description = "Error Occured!";
      main = "Error Occured!";
    }
  }
}
