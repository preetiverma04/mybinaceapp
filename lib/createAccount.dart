

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
class create_Account extends StatefulWidget{
  @override
  State<create_Account> createState() => _create_AccountState();
}

class _create_AccountState extends State<create_Account> {
 bool  visibility=true;
  @override
  Widget build(BuildContext context) {

    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white,size: width*0.4/5),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
      child:   Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: height*0.1/5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage("images/Binance_Logo.png"),
                    color: Colors.yellow.shade800,
                    size: width * 0.7 / 5,
                  ),
                  SizedBox(width: width*0.3/5,),
                  Text("BINANCE",style: TextStyle(color: Colors.yellow.shade800,fontSize: 40),),
                ],

              ),
            ),
            Column(
              children: [
                chooseImage( width, height),
                SizedBox(height: height*0.2/5,),
                createAccountField( width,height),
                SizedBox(height: height*0.2/5,),
                getStartedButton( width, height,context),

              ],
            ),
          ],
        ),
      ),
    );
  }

 final List<Map<String, String>> textFieldData = [
   {'hint_text': 'Name'},
   {'hint_text': 'Email'},
   {'hint_text': 'Password'},
 ];
 Widget createAccountField(double width, double height) {
   return Column(
     children: textFieldData.map((data) {
       String hintText = data['hint_text'] ?? '';
       bool isPassword = hintText == 'Password';

       return Container(
         height: height * 0.6 / 5,
         margin: EdgeInsets.symmetric(horizontal: 14.0),
         child: TextField(

           cursorColor: Colors.white,
           enabled: true,
           style: TextStyle(color: Colors.white),
           maxLines: 1,
           obscureText: isPassword && visibility,
           decoration: InputDecoration(

             hintText: hintText,
             suffixIcon: isPassword
                 ? IconButton(
               onPressed: () {
                 setState(() {
                   visibility = !visibility;
                 });
               },
               icon: Icon(
                 visibility
                     ? Icons.visibility
                     : Icons.visibility_off,
                 color: Colors.white,

               ),
             )
                 : null,
             hintStyle: TextStyle(
               color: Colors.white,
             ),
             focusedBorder: OutlineInputBorder(
               borderSide: BorderSide(
                 width: 2.0,
                 color: Colors.white,
               ),
               borderRadius: BorderRadius.circular(20.0),
             ),
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(20.0),
               borderSide: BorderSide(
                 color: Colors.white,
                 width: 2.0,
               ),
             ),
           ),
         ),
       );
     }).toList(),
   );
 }

 Widget chooseImage(double width,double height){
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: height*0.1/5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: CircleAvatar(
          radius: 55,
          child: IconButton(
            onPressed: (){},
            icon:Icon(Icons.photo_camera_outlined,color: Colors.black,size: width*0.5/5,),
          ),

        ),
      ),
    ],

  );
}
Widget getStartedButton(double width,double height, BuildContext context){
  return Container(
    width: width*4.4/5,
    height: height*0.4/5,
    child: ElevatedButton(
        onPressed: (){
          Navigator.pushNamed(context, 'otp');
        },
        child: Text("Get Started",style: TextStyle(color: Colors.black,fontSize: width*0.3/5,fontWeight: FontWeight.w700),),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow.shade700),
      shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17.0),
      ))
    ),
    ),
  );
}}
