import 'dart:async';
import 'dart:convert';
import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'Model.dart';

class cryptoData extends StatefulWidget {
  const cryptoData({super.key});

  @override
  State<cryptoData> createState() => _cryptoDataState();
}

class _cryptoDataState extends State<cryptoData> {

  late Future<List<CryptoPricedata>> futuredata;

  // double percentageChange(){
  //   double currentPrice = double.parse(price);
  //   double prevPrice = double.parse(prevClosePrice);
  //   return ((currentPrice - prevPrice) / prevPrice) * 100;
  // }

  @override
  void initState() {
    super.initState();
    futuredata = getData2();
  }

  Future<List<CryptoPricedata>> getData2() async {
    var res = await http
        .get(Uri.parse("https://api1.binance.com/api/v3/ticker/price"));
    print("Response status code: ${res.statusCode}");
    print(res);
    print("Response body: ${res.body}");

    if (res.statusCode == 200) {
      List<dynamic> jsondata2 = json.decode(res.body);
      List<CryptoPricedata> data = [];
      for (var item in jsondata2) {
        data.add(CryptoPricedata.fromJson(item));
      }
      return data;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Scaffold(

      backgroundColor: Colors.black,
      body: Column(

        children: [
          Container(
            margin: EdgeInsets.only(top: height*0.25/5),
              child: searchCoinpairs(width,height)),

          SizedBox(
              height:height*0.8/5,child: TabBarText()),
          SizedBox(height:height*0.4/5,child: headingData1(width,height)),
          headingData2(),
          Expanded(
            child: FutureBuilder<List<CryptoPricedata>>(

              future: futuredata,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      CryptoPricedata cryptopricedata1 = snapshot.data![index];
                      return Container(
                        width: width*0.5/5,
                        height: height*0.26/5,
                        color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "${cryptopricedata1.symbol}",
                                style: TextStyle(fontSize: 20.0,color: Colors.white),
                              ),
                            ),
                            Container(

                                child: Text(" ${cryptopricedata1.price}", style: TextStyle(fontSize: 14.0,color: Colors.white),
                                  textAlign: TextAlign.center,)),
                            Container(
                              width: width*1.1/5,
                              height: height*0.2/5,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Center(
                                child: Text(
                                  "${cryptopricedata1.percentageChange().toStringAsFixed(1)}%"
                                  , style: TextStyle(fontSize: 16.0,color: Colors.white),),
                              ),
                            ), // Display percentage change
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text('No data available'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
class TabBarText extends StatefulWidget {
  const TabBarText({Key? key});

  @override
  State<TabBarText> createState() => _TabBarTextState();
}

class _TabBarTextState extends State<TabBarText> {
  final List<String> marketdatabar = ["Favourite", "Market","Discover", "Square", "Data"];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return DefaultTabController(

      length: marketdatabar.length,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          TabBar(
            isScrollable: true,
            tabs: marketdatabar.map((data) {
              return Container(
                margin: EdgeInsets.only(top: height*0.1/5,right: width*0.01/5),
                child: Padding(
                  padding: EdgeInsets.only(right: width*0.1/5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: width * 0.1 / 5),
                        child: Tab(
                          child: Text(
                            data,
                            style: TextStyle(color: Colors.white, fontSize: 16.0),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
            indicatorColor: Colors.yellow.shade700,
          ),
          Expanded(
            child: TabBarView(
              children: marketdatabar.map((data) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(

                      margin:EdgeInsets.only(top: height*0.10/5),

                      child: Text(
                        data,
                        style: TextStyle(fontSize: 24.0, color: Colors.blue),
                      ),
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
Widget searchCoinpairs(double width, double height) {
  return Container(
    width: width * 4.4 / 5,
    height: height * 0.25 / 5,
    margin: EdgeInsets.only(right: 0.2 / 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14.0),
    ),
    child: Row(

      children: [
        Expanded(
          child: TextField(

            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,

              focusColor: Colors.grey.shade900,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade800),
                borderRadius: BorderRadius.circular(14.0),
              ),

              fillColor: Colors.grey.shade900,
              hintText: "Search coins Pairs",
              prefixIcon: Icon(Icons.search, color: Colors.white),
              hintStyle: TextStyle(color: Colors.grey.shade600),
              contentPadding: EdgeInsets.only(
                left: width * 0.1 / 5,
                right: width * 0.1 / 5,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.0),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: width * 0.004 / 5,
                ),
              ),
            ),
            enabled: true,

          ),
        ),
        SizedBox(width: width * 0.4 / 5),
        Icon(
          Icons.more_horiz,
          color: Colors.white,
        ),
      ],
    ),
  );
}
Widget headingData1(double width,double height){
  return Row(

    children: [
      SizedBox( width:width*0.6/5,child: Text("spot",style: TextStyle(color: Colors.grey.shade600,fontSize: 18.0),)),
      SizedBox(width:width*0.9/5,child: Text("Futures",style: TextStyle(color: Colors.grey.shade600,fontSize: 18.0),)),
      SizedBox(width:width*0.9/5,child: Text("Option",style: TextStyle(color: Colors.grey.shade600,fontSize: 18.0),)),
    ],
  );

}
Widget headingData2(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Name/Vol",style: TextStyle(color: Colors.grey.shade700,fontSize: 16.0),),
      Text("last Price",style: TextStyle(color: Colors.grey.shade700,fontSize: 16.0),),
      Text("24h Chg%",style: TextStyle(color: Colors.grey.shade700,fontSize: 16.0),),
    ],
  );

}


