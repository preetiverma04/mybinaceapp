import 'package:flutter/material.dart';

import 'package:myapplication2/createAccount.dart';
import 'package:myapplication2/homeScreen.dart';
import 'package:myapplication2/login_screen.dart';
import 'package:myapplication2/otp.dart';
import 'otp2Screen.dart';
import 'splashScreen.dart';
import 'markets.dart';


void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splashScreen',
      routes: {
        'splashScreen':(context)=>SplashScreen(),
        'login_screen':(context)=>loginScreen(),
        'createAccount':(context)=>create_Account(),
        'otp':(context)=>Otp(),
        'otp2Screen':(context)=>Otp2(),
        'homeScreen':(context)=>HomeScreen(),
        'markets':(context)=>MarketDataPage(),
      }


    );
  }

}
