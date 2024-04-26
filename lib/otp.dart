import 'package:flutter/material.dart';

class Otp extends StatelessWidget {
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
  return Container(
    margin: EdgeInsets.only(left : width * 0.3 / 5,right : width * 0.3 / 5,top: height*0.2/5),
    child: TextField(
      style: TextStyle(color: Colors.white),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "+91",
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
    ),
  );
}
Widget otpButton(double width,double height,BuildContext context){
  return Container(
    margin: EdgeInsets.only(top: height*0.2/5),
    width: width*4.0/5,
    height: height*0.4/5,
    child: ElevatedButton(onPressed: (){
      Navigator.pushNamed(context, 'otp2Screen');
    },
        style: ButtonStyle(

          backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow.shade800)
        ),
        child:Text("Get OTP",style: TextStyle(color: Colors.white,fontSize: width*0.25/5),) ),
  );
}