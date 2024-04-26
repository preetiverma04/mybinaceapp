import 'package:flutter/material.dart';
class loginHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginhomeWidth = MediaQuery.of(context).size.width;
    final loginhomeheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.only(top:loginhomeheight*0.2/5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage("images/Binance_Logo.png"),
                      color: Colors.yellow.shade600,
                      size: loginhomeWidth * 0.7 / 5,
                    ),
                    SizedBox(width: loginhomeWidth * 0.40 / 5),
                    Text(
                      "BINANCE",
                      style: TextStyle(
                        fontSize: loginhomeWidth * 0.46 / 5,
                        color: Colors.yellow.shade600,
                      ),
                    ),
                  ],
                ),
                SizedBox( height: loginhomeheight*0.15/5,),
                loginImage( context),
                SizedBox( height: loginhomeheight*0.15/5,),
                loginHomeButtons(context),
              ],

            ),
          ),
        ),
      ),
    );
  }
}
Widget loginImage(BuildContext context){
  final Loginimagewidth=MediaQuery.of(context).size.width;
  final Loginimageheight=MediaQuery.of(context).size.height;
  return Container(
    margin: EdgeInsets.only(top: Loginimageheight*0.4/5 ),
    width: double.infinity,
    height: Loginimageheight*1.8/5,
    decoration: BoxDecoration(
      color: Colors.black,
      image: DecorationImage(
                image: AssetImage("images/loginhome.png"),
        fit: BoxFit.cover
      )
    ),
  );
}
final List<Map<String,dynamic>> loginhomedata=[
  {  "title":"login" ,"color":Colors.yellow.shade700,'route':'login_screen'},
  {"title":"Get Started","color":Colors.white,'route':'createAccount'},
];

Widget loginHomeButtons(BuildContext context) {
  final loginhomebuttonWidth=MediaQuery.of(context).size.width;
  final loginhomebuttonheight=MediaQuery.of(context).size.height;
  return Column(
    children: loginhomedata.map((data) {
    final  String title = data["title"];
    final  Color color = data["color"];

      return Container(
        margin: EdgeInsets.only(top: loginhomebuttonheight*0.25/5),
         width:  loginhomebuttonWidth*4.2/5,
        height:  loginhomebuttonheight*0.36/5,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, data['route']);

          },
          style: ElevatedButton.styleFrom(
           backgroundColor: color,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(17.0),

          ),),
          child: Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
              fontSize: loginhomebuttonWidth*0.25/5)),
        ),
      );
    }
    ).toList(),
  );
}
