import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapplication2/bottombar.dart';

class Otp2 extends StatefulWidget {
  @override
  _Otp2State createState() => _Otp2State();
}

class _Otp2State extends State<Otp2> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(4, (index) => TextEditingController());
    focusNodes = List.generate(4, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

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
                margin: EdgeInsets.only(top: height * 0.2 / 5),
                child: Center(
                  child: Text(
                    "OTP Verification",
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.2 / 5,
              ),
              imageOtp(width, height),
              SizedBox(
                height: height * 0.1 / 5,
              ),
              textOtpVerify2(width, height),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OtpVerifyTextField(width, height),
                ],
              ),
              otpButton(width, height, context),
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
        width: width * 4.4 / 5,
        height: height * 1.8 / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200.0),
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("images/lock.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget textOtpVerify(double width, double height) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.1 / 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Enter your Mobile Number for",
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.25 / 5,
              ),
            ),
          ),
          Center(
            child: Text(
              "OTP Verification",
              style: TextStyle(
                color: Colors.yellow.shade800,
                fontSize: width * 0.25 / 5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget OtpVerifyTextField(double width, double height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4,
            (index) {
              return Container(
          margin: EdgeInsets.only(top: height * 0.2 / 5,left:width*0.2/5),
          width: width * 0.8/ 5,
          height: height * 0.4 / 5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            onChanged: (value) {
              if (value.length == 1 && index < 3) {

                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
              }
            },
            keyboardType: TextInputType.number,
            maxLength: 1,
            style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              counterText: "",

              hintStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            textAlign: TextAlign.center,
          ),);
            },
      ),
    );
  }

  Widget otpButton(double width, double height, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.3 / 5),
      width: width * 4.2 / 5,
      height: height * 0.4 / 5,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => bottomnavbar()),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.yellow.shade800,
          ),
        ),
        child: Text(
          "Verify",
          style: TextStyle(color: Colors.white, fontSize: width * 0.25 / 5),
        ),
      ),
    );
  }
}



  Widget textOtpVerify2(double width, double height) {
    return Container(
      margin: EdgeInsets.only(top:height*0.1/5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
                "Enter the OTP sent to your",
                style: TextStyle(color: Colors.white, fontSize: width * 0.25 / 5),
              )),
          Center(
              child: Text(
                "mobile number",
                style: TextStyle(
                    color: Colors.yellow.shade800, fontSize: width * 0.25 / 5),
              )),
        ],
      ),
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