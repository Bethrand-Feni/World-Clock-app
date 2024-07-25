import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location = ''; //location name for UI
  late String time; //the time in that location
  late String flag; //url to an asset flag icon
  String url = ''; //location url for api endpoint
  bool isDayTime = false;//changes image based on condition

  WorldTime({required this.location, required this.flag, required this.url});

  Future <void> getTime() async {
    try {
      Uri link = Uri.parse(
          'https://timeapi.io/api/Time/current/zone?timeZone=$url');
      Response response = await get(link);
      Map data = jsonDecode(response.body);
      // print(data);

      // get properties from data
      String datetime = data['dateTime'];
      int offset = data['year'];


      // // create DataTime object
      DateTime now = DateTime.parse(datetime);
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      print("IsDayTime");
      print(isDayTime);
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("Caught error: $e");
    }
  }
}
