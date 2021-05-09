import 'package:flutter/material.dart';
import 'package:world_clock/gettime.dart';

class Chooselocation extends StatefulWidget {
  @override
  _ChooselocationState createState() => _ChooselocationState();
}

class _ChooselocationState extends State<Chooselocation> {

  List<Setdate> locations=[
    Setdate(url:'Asia/Kolkata',location:'Kolkata'),
    Setdate(url:'Asia/Tokyo',location:'Tokyo'),
    Setdate(url:'Asia/Dubai',location:'Dubai'),
    Setdate(url:'Asia/Bangkok',location:'Bangkok'),
    Setdate(url:'Europe/London',location:'London'),
    Setdate(url:'Europe/Moscow',location:'Moscow'),
    Setdate(url:'Europe/Paris',location:'Paris'),
    Setdate(url:'America/Chicago',location:'Chicago'),
    Setdate(url:'Australia/Sydney',location:'Sydney'),
    Setdate(url:'America/Bogota',location:'Bogota'),
    Setdate(url:'America/Denver',location:'Denver'),
    Setdate(url:'America/Detroit',location:'Detroit'),
    Setdate(url:'America/Havana',location:'Havana'),
    Setdate(url:'America/Jamaica',location:'Jamaica'),
    Setdate(url:'America/Los_Angeles',location:'Los Angeles'),
    Setdate(url:'America/New_York',location:'New York'),
    Setdate(url:'America/Toronto',location:'Toronto'),
    Setdate(url:'Asia/Baghdad',location:'Baghdad'),
    Setdate(url:'Asia/Colombo',location:'Colombo'),
    Setdate(url:'Asia/Jakarta',location:'Jakarta'),
    Setdate(url:'Asia/Singapore',location:'Singapore'),
    Setdate(url:'Asia/Shanghai',location:'Shanghai'),
    Setdate(url:'Australia/Melbourne',location:'Melbourne'),
    Setdate(url:'Europe/Dublin',location:'Dublin'),
    Setdate(url:'Europe/Istanbul',location:'Istanbul'),
    Setdate(url:'Indian/Cocos',location:'Cocos'),
    Setdate(url:'Indian/Maldives',location:'Maldives'),
    Setdate(url:'Pacific/Tahiti',location:'Tahiti'),
  ];

  void updatedata(index) async{
    Setdate ins=locations[index];
    await ins.gettime();
    Navigator.pop(context, {
      'location': ins.location,
      'datetime': ins.dateTime,
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location',
        style: TextStyle(
          fontFamily: 'Varino'
        ),
        ),
        backgroundColor: Colors.purple[100],
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical:0.0),
                child: Card(
                  child: ListTile(
                    onTap: (){
                      updatedata(index);
                    },
                    title: Text(locations[index].location),
                  ),
                ),
              );
          },
      ),
    );
  }
}
