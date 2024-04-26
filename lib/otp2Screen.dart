import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapplication2/bottombar.dart';

class Otp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: height*0.2/5),
                child: Center(
                    child: Text(
                      "OTP Verification",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    )),
              ),
              SizedBox(
                height: height * 0.2 / 5,
              ),
              imageOtp(width, height),
              SizedBox(
                height: height * 0.1 / 5,
              ),
              textOtpVerify(width, height),
              phoneNumberTextField(width,height),
              otpButton(width,height,context),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageOtp(double width, double height) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: width * 0.1 / 5, top: height * 0.2 / 5),
        width: width * 3.7 / 5,
        height: height * 1.8 / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.red,
          image: DecorationImage(
              image: AssetImage("images/otpverify.png"), fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget textOtpVerify(double width, double height) {
    return Container(
      margin: EdgeInsets.only(top:height*0.1/5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
                "Enter your Mobile Number for",
                style: TextStyle(color: Colors.white, fontSize: width * 0.25 / 5),
              )),
          Center(
              child: Text(
                "OTP Verification",
                style: TextStyle(
                    color: Colors.yellow.shade800, fontSize: width * 0.25 / 5),
              )),
        ],
      ),
    );
  }
}

Widget phoneNumberTextField(double width, double height) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
     Container(
       margin: EdgeInsets.only(top:height*0.2/5),
       width: width*0.5/5,
       height: height*0.3/5,
       color: Colors.white,
       child: Center(child: Text("1",style: TextStyle(color: Colors.black,fontSize: width*0.3/5),)),
     ),
      Container(
        margin: EdgeInsets.only(left: width*0.5/5,top:height*0.2/5),
        width: width*0.5/5,
        height: height*0.3/5,
        color: Colors.white,
        child: Center(child: Text("2",style: TextStyle(color: Colors.black,fontSize: width*0.3/5),)),
      ),
      Container(
        margin: EdgeInsets.only(left: width*0.5/5,top:height*0.2/5),
        width: width*0.5/5,
        height: height*0.3/5,
        color: Colors.white,
        child: Center(child: Text("3",style: TextStyle(color: Colors.black,fontSize: width*0.3/5),)),
      ),
      Container(
        margin: EdgeInsets.only(left: width*0.5/5,top:height*0.2/5),
        width: width*0.5/5,
        height: height*0.3/5,
        color: Colors.white,
        child: Center(child: Text("4",style: TextStyle(color: Colors.black,fontSize: width*0.3/5),)),
      ),
    ],
  );
}
Widget otpButton(double width,double height,BuildContext context){
  return Container(
    margin: EdgeInsets.only(top: height*0.3/5),
    width: width*4.2/5,
    height: height*0.4/5,
    child: ElevatedButton(onPressed: (){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => bottomnavbar()));
    },
        style: ButtonStyle(

            backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow.shade800)
        ),
        child:Text("Verify",style: TextStyle(color: Colors.white,fontSize: width*0.25/5),) ),
  );
}