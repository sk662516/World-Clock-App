import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_clock/pages/home.dart';
import 'package:world_clock/pages/choose_location.dart';
import 'package:world_clock/pages/loading.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        //initialRoute: '/home',
        routes: {
            '/': (context) => Loading(),
            '/home': (context) => Home(),
            '/location': (context) => Chooselocation(),
        },
    ));
}

