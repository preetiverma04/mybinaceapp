

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapplication2/loginhomeScreen.dart';
class SplashScreen extends StatefulWidget {  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){

    super.initState();
    Timer(Duration(seconds: 4),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginHomeScreen()));
    }

    );
  }
  Widget build(BuildContext context) {
   return Scaffold(
     body: Stack(
       children: [
         splashdata(context),
       ],
     ),

   );

  }}
Widget splashdata(BuildContext context){
  final splashWidth=MediaQuery.of(context).size.width;
  return Stack(children: [
    Container(

      decoration: BoxDecoration(
        color: Colors.black,
        // image: DecorationImage(
        //   image: AssetImage('images/splashscreen.png'),
        //   fit: BoxFit.cover,
        //
        // ),
      ),

    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageIcon(
          AssetImage("images/Binance_Logo.png"),
          color: Colors.yellow.shade700,
          size: splashWidth*0.9/5,
        ),
         SizedBox(width: splashWidth*0.40/5,),
         Center(child: Text("BINANCE",style: TextStyle(color: Colors.yellow.shade700,fontSize: splashWidth*0.45/5,fontWeight: FontWeight.w500),)),
      ],
    ),

  ],

  );
}

