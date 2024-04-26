import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class loginScreen extends StatefulWidget {
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool visibility = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white, size: 30.0),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage("images/Binance_Logo.png"),
                  color: Colors.yellow.shade800,
                  size: width * 0.7 / 5,
                ),
                SizedBox(
                  width: width * 0.3 / 5,
                ),
                Text(
                  "BINANCE",
                  style: TextStyle(
                      color: Colors.yellow.shade800, fontSize: width * 0.6 / 5),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: height * 0.2 / 5),
                  width: width * 1.6 / 5,
                  height: height * 1.0 / 5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/Binance_Logo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.3 / 5,
                ),
                textFields(width, height),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget textFields(double width, double height) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: width*0.1/5,right: width*0.2/5),
          height: height * 0.4 / 5,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
          child: TextField(
            controller: emailController,
            maxLines: 1,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: TextStyle(color: Colors.white, fontSize: width * 0.2 / 5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: width * 0.001 / 5,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.2 / 5,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: height*0.4/5,
                margin: EdgeInsets.only(left: width*0.1/5,right: width*0.2/5),
                child: TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.number,
                  obscureText: visibility,
                  maxLines: 1,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          visibility = !visibility;
                        });
                      },
                      icon: Icon(
                        visibility ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                      ),
                    ),
                    hintStyle: TextStyle(color: Colors.white, fontSize: width * 0.2 / 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: width * 0.01 / 5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.3 / 5, // Add space below the password field
        ),
        Column(
          children: [
            loginButton(width, height),
          ],
        ),
      ],
    );
  }


  Widget loginButton(double width, double height) {
    String enteredEmail = emailController.text;
    String Message = '';

    String enteredPassword = passwordController.text;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: width*0.1/5,right: width*0.2/5,top: height*0.1/5),
          width: width * 4.5 / 5,
          height: height * 0.37 / 5,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                if (enteredEmail.isNotEmpty && enteredPassword.isNotEmpty) {
                  Message = "Successful login";
                  print("Message: $Message");
                } else {
                  Message = "Please enter both email and password";
                  print("Message: $Message");
                }
              });
            },
            child: Text(
              "Login",
              style: TextStyle(color: Colors.black, fontSize: width * 0.28 / 5),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.yellow.shade800),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>
                (RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0))),

            ),

          ),
        ),
        SizedBox(
          height: height * 0.08 / 5,
        ),
        Text(
          Message,
          style: TextStyle(fontSize: width * 0.3 / 5, color: Colors.white),
        ),
      ],
    );
  }
}
