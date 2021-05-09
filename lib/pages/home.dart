import 'package:flutter/material.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  String date;
  String time;
  String bgimg;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(minutes: 1), (Timer t) {
      setState(() {
        if (data != {} && data['datetime'] != null) {
          data['datetime'] = data['datetime'].add(Duration(minutes: 1));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? (ModalRoute.of(context).settings.arguments) : data;
    if (data['datetime'] != null) {
      int tmp = data['datetime'].hour;
      bgimg = tmp >= 6 && tmp < 18 ? 'day.jpg' : 'night.jpg';
      date = data['datetime'].toString().substring(0, 10);
      time = data['datetime'].toString().substring(11, 16);
    }else{
      date = 'Server Error';
      time = 'Error';
      bgimg = 'night.jpg';
    }
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgimg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 45,
              ),
              FlatButton.icon(
                onPressed: () async {
                  dynamic val = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    if(val!=null){
                      data = val;
                    }
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  size: 28.0,
                  color: Colors.white,
                ),
                label: Text(
                  'Edit location',
                  style: TextStyle(
                      fontSize: 19.0,
                      color: Colors.white,
                      fontFamily: 'Varino'),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Unbutton',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontFamily: 'Varino',
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontFamily: 'Varino',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
