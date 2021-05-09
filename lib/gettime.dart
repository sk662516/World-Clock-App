import 'package:http/http.dart';
import 'dart:convert';

class Setdate{
  DateTime dateTime;
  String location;
  String url;
  Setdate({this.url,this.location});

  Future<void> gettime() async{
    try{
      Response response = await get(Uri.https('worldtimeapi.org','api/timezone/$url'));
      Map data=jsonDecode(response.body);
      int hour=int.parse(data['utc_offset'].substring(1,3));
      int minute=int.parse(data['utc_offset'].substring(4,6));
      dateTime=DateTime.parse(data['utc_datetime']);
      dateTime=dateTime.add(Duration(hours: hour,minutes: minute));
      //print(dateTime.toString().substring(11,16));
    }catch(e){
      print('Error is : $e');
      dateTime=null;
    }
  }
}