

import 'package:flutter/Material.dart';
import'package:flutter/material.dart';



class WalletTextBar extends StatefulWidget {
  const WalletTextBar({super.key});
  @override
  State<WalletTextBar> createState() => _WalletTextBarState();
}
class _WalletTextBarState extends State<WalletTextBar> {
  @override
  Widget build(BuildContext context) {
    // final width=MediaQuery.of(context).size.width;
    final height =MediaQuery.of(context).size.height;
    final List<String> walletTabViewData = ["Overview", "Spot", "Funding", "Earn", "Futures","Margin"];
    return DefaultTabController(

      length: walletTabViewData.length,
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
           TabBar(
                isScrollable: true,
                tabs: walletTabViewData.map((data) {
                  return Tab(
                    child: Text(
                      data, style: TextStyle(color: Colors.white,fontSize: 16.0),
                    ),
                  );
                }).toList(),
                indicatorColor: Colors.yellow.shade300,
                // unselectedLabelColor: Colors.grey,

              ),

            ],
          ),
          Expanded(
            child: TabBarView(

              children: walletTabViewData.map((data) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data,
                      style: TextStyle(color: Colors.blue,fontSize: 27.0),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
class walletsScreen extends StatelessWidget{
  const walletsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height =MediaQuery.of(context).size.height;
   return Scaffold(
     backgroundColor: Colors.black,
     body: SafeArea(
       child: SingleChildScrollView(
         scrollDirection: Axis.vertical,
         child: Column(
           children: [
             ExchangeContainer(width,height),
             SizedBox(height: height*0.1/5,),
             Column(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 SizedBox(
                   height: height*0.7/5,
                   child: WalletTextBar(),

                   ),
               ],
             ),

             totalBlanceText(width,height),
             SizedBox(height: height*0.05/5,),
             Buttons(width,height),
             SizedBox(height: height*0.05/5,),

             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 SizedBox(

                      height: height*0.6/5,
                      width: width*2.5/5,
                     child: walletTextBar2()),
               ],

             ),
             AccountRelatedData(width,height),

           ],

         ),
       ),
     ),
   );
  }
}
Widget ExchangeContainer(double width, double height){
  return Row(

    children: [
      Container(
        margin: EdgeInsets.only(left: width*0.5/5,top: height*0.1/5),
        decoration: BoxDecoration(
          color: Colors.grey.shade800
        ),
        width: width*1.9/5,
        height: height*0.25/5,
        child: Center(child: Text("Exchange",style: TextStyle(color: Colors.white,fontSize: 20.0),)),
      ),
      Container(
        margin: EdgeInsets.only(top: height*0.1/5),
        decoration: BoxDecoration(
            color: Colors.grey.shade600
        ),
        width: width*1.9/5,
        height: height*0.25/5,
        child: Center(child: Text("Web 3",style: TextStyle(color: Colors.white,fontSize: 20.0),)),
      ),
    ],

  );
}
Widget totalBlanceText(double width, double height){
  return Column(
    children: [
      Container(

        width: width*3.5/5,

        margin: EdgeInsets.only(right: width*2.5/5,left: width*0.2/5),
        child: Text("Total Balance",style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.w400),),
      ),
      Row(

        children: [
          Container(
            margin: EdgeInsets.only(left: width*0.2/5,top: height*0.03/5),
            width: width*1.4/5,
            child: Text("₹4.95",style: TextStyle(color: Colors.white,fontSize: 40.0,fontWeight: FontWeight.w500),),
          ),
           Text("INR",style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.w400),),
        ],
      ),
    ],
  );
}
Widget Buttons(double width,double height){
  return Row(
    children: [
      Container(
        margin: EdgeInsets.only(left: width*0.2/5),
        width: width*2.2/5,
        height: height*0.28/5,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(child: Text("Deposit",style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w600),)),
      ),
      Container(
        margin: EdgeInsets.only(left: width*0.2/5),
        width: width*2.2/5,
        height: height*0.27/5,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(child: Text("Buy",style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w600,color: Colors.white),)),
      )
    ],
  );
}
class walletTextBar2 extends StatefulWidget {
  const walletTextBar2({Key? key});

  @override
  State<walletTextBar2> createState() => _walletTextBar2State();
}

class _walletTextBar2State extends State<walletTextBar2> {
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height =MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Container(
        // width: width*2.5/5,
        margin: EdgeInsets.only(right: width*0.3/5),
        child: Column(

         crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(

              width: width*3.5/5,
              margin: EdgeInsets.only(right: width*0.1/5),
              child: TabBar(
                tabs: [
                  Tab(child: Text("Crypto", style: TextStyle(color: Colors.white,fontSize: 11.0))),
                  Tab(child: Text("Account", style: TextStyle(color: Colors.white,fontSize: 11.0))),
                ],
                indicatorColor: Colors.yellow,
              ),

            ),
            // Container(
            //   margin: EdgeInsets.only(left: width*1.8/5),
            //   width: width*1.8/5,
            //   color: Colors.red,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //
            //     children: [
            //       Icon(Icons.person,color: Colors.white,),
            //       Icon(Icons.person,color: Colors.white,),
            //     ],
            //   ),
            // ),
            Expanded(
              child: Container(
                height: height*2.5/5,
              
                margin: EdgeInsets.only(left: width*0.7/5,top: height*0.1/5,),
                child: TabBarView(
                  children: [
                    Text("Crypto", style: TextStyle(color: Colors.blue,fontSize: 19.0),),
                    Text("Account", style: TextStyle(color: Colors.blue,fontSize: 19.0)),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
final List<Map<String,dynamic>> listAccountData=[
  { "text1":"USD-M Futures","text2":"₹3.52"},
  { "text1":"Funding","text2":"₹0.82586771","text3":"Daily PNl %"},
  { "text1":"Spot","text2":"₹0.60563632"},
  { "text1":"Earn","text2":"₹0"},
  { "text1":"COIN-M-Futures","text2":"₹0"},
  { "text1":"Cross Margin","text2":"₹0"},

];
Widget AccountRelatedData(double width,double height){
  return Column(

    children: listAccountData.map((item) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width*1.8/5,
            margin: EdgeInsets.only(left:width*0.2/5,right: width*0.3/5,top: height*0.2/5),
            child: Text(item["text1"],style: TextStyle(color: Colors.white,fontSize: 18.0),),
          ),
          Container(
            width: width*1.6/5,
            margin: EdgeInsets.only(left:width*0.1/5,right: width*0.3/5,top: height*0.2/5),
            child: Text(item["text2"],style: TextStyle(color: Colors.white,fontSize: 18.0),),
          ),
        ],
      );
    }).toList(),
  );
}






