import 'package:flutter/material.dart';

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
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Tab(
                        child: Text(
                          data,
                          style: TextStyle(color: Colors.white, fontSize: 20.0),

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

class MarketDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              searchCoinpairs(width, height),
              SizedBox(

                width: width*4.8/5,
                height: height*0.8/5,
                child: TabBarText(),
              ),
              marketData(width, height),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchCoinpairs(double width, double height) {
    return Container(
      width: width * 4.4 / 5,
      height: height * 0.25 / 5,
      margin: EdgeInsets.only(right: 0.2/5),
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
                hintStyle: TextStyle(color: Colors.white),
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
}

final List<Map<String, String>> market_data = [
  {
    "text1": "XRP",
    "text2": "/USDT",
    "text3": "10x",
    "price": "0.5476",
    "percentage": "0.00%",
    "color": "green",
  },
  {
    "text1": "MEME ",
    "text2": "/USDT",
    "text3": "5x",
    "price": "0.02937",
    "percentage": "0.00%",
    "color": "red",
  },
  {
    "text1": "TLM",
    "text2": "/USDT",
    "text3": "5X",
    "price": "0.01746",
    "percentage": "-14.1%",
    "color": "green",
  },
  {
    "text1": "XVG",
    "text2": "/USDT",
    "text3": "5x",
    "price": "0.006066",
    "percentage": "0.00%",
    "color": "red",
  },
  {
    "text1": "XRP",
    "text2": "/USDT",
    "text3": "10x",
    "price": "0.5476",
    "percentage": "0.00%",
    "color": "green",
  },
  {
    "text1": "ADA",
    "text2": "/USDT",
    "text3": "10x",
    "price": "0.5187",
    "percentage": "0.00%",
    "color": "red",
  },
  {
    "text1": "TRX",
    "text2": "/USDT",
    "text3": "10x",
    "price": "0.11214",
    "percentage": "0.00%",
    "color": "green",
  },
  {
    "text1": "MEME ",
    "text2": "/USDT",
    "text3": "5x",
    "price": "0.02937",
    "percentage": "0.00%",
    "color": "red",
  },
  {
    "text1": "TLM",
    "text2": "/USDT",
    "text3": "5X",
    "price": "0.01746",
    "percentage": "-14.1%",
    "color": "green",
  },
  {
    "text1": "XVG",
    "text2": "/USDT",
    "text3": "5x",
    "price": "0.006066",
    "percentage": "0.00%",
    "color": "red",
  },
  {
    "text1": "XRP",
    "text2": "/USDT",
    "text3": "10x",
    "price": "0.5476",
    "percentage": "0.00%",
    "color": "green",
  },
  {
    "text1": "ADA",
    "text2": "/USDT",
    "text3": "10x",
    "price": "0.5187",
    "percentage": "0.00%",
    "color": "red",
  },
  {
    "text1": "TRX",
    "text2": "/USDT",
    "text3": "10x",
    "price": "0.11214",
    "percentage": "0.00%",
    "color": "green",
  },
];

Widget marketData(double width, double height) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Container(
      margin: EdgeInsets.only(top: height * 0.1 / 5),
      child: Column(
        children: market_data.map((item) {
          Color textColor;
          if (item["color"] == "red") {
            textColor = Colors.red;
          } else if (item["color"] == "green") {
            textColor = Colors.green;
          } else {
            textColor = Colors.red; // Default color
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width * 1.8 / 5,
                margin: EdgeInsets.only(left: width * 0.1 / 5),
                child: Row(
                  children: [
                    Text(
                      item["text1"]!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.30 / 5,
                      ),
                    ),
                    SizedBox(width: 0.01 / 5),
                    Text(
                      item["text2"]!,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: width * 0.22 / 5,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: width * 0.5 / 5,
                height: height * 0.15 / 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                ),
                child: Center(
                  child: Text(
                    item["text3"]!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.2 / 5,
                    ),
                  ),
                ),
              ),
              Container(
                width: width * 1.1 / 6,
                margin: EdgeInsets.only(left: width * 0.3 / 5),
                child: Text(
                  item["price"]!,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Container(
                width: width * 1.0 / 5,
                height: height * 0.2 / 5,
                decoration: BoxDecoration(
                  color: textColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                margin: EdgeInsets.only(left: width * 0.2 / 5),
                child: Center(
                  child: Text(
                    item["percentage"]!,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: height * 0.2 / 5,
                margin: EdgeInsets.only(top: width * 0.2 / 5),
              )
            ],
          );
        }).toList(),
      ),
    ),
  );
}
