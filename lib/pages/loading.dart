import 'package:flutter/material.dart';
import 'package:world_clock/gettime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setuptime() async{
    Setdate ins=Setdate(url: 'Asia/Kolkata',location: 'Kolkata');
    await ins.gettime();
    Navigator.pushReplacementNamed(
        context, '/home',
        arguments: {
          'location': ins.location,
          'datetime': ins.dateTime,
        });
  }

  @override
  void initState() {
    super.initState();
    setuptime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
