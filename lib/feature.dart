import 'package:flutter/Material.dart';
import 'package:flutter/widgets.dart';

class FeatureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.8 / 5,
              child: featureBar(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.5 / 5,
                  child: featureText(width, height),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.3 / 5,
              child: buttons_headings(width, height),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.7 / 5,
                  child: AvblText(width, height),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SizedBox(height: 1.5 / 5,),
                limitContainer(width, height),
              ],
            )
          ],
        ),
      ),
    );
  }
}

final List<String> featureBarData = [
  "USD-M",
  "COIN-M",
  "Options",
  "Bots",
  "Copy Trading"
];

class featureBar extends StatefulWidget {
  const featureBar({super.key});

  @override
  State<featureBar> createState() => _featureBarState();
}

class _featureBarState extends State<featureBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: featureBarData.length,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabs: featureBarData.map((data) {
                return Row(
                  children: [
                    Tab(
                      child: Text(
                        data,
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    )
                  ],
                );
              }).toList(),
              indicatorColor: Colors.yellow,
            ),
            Expanded(
              child: TabBarView(
                children: featureBarData.map((data) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data,
                        style: TextStyle(color: Colors.blue, fontSize: 20.0),
                      )
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ));
  }
}

Widget featureText(double width, double height) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        children: [
          Container(
              margin: EdgeInsets.only(left: width * 0.2 / 5),
              child: Text(
                "BTCUSDC",
                style: TextStyle(color: Colors.white, fontSize: 28.0),
              )),
          SizedBox(
            width: width * 0.1 / 5,
          ),
          Container(
            child: Text(
              "Perp",
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: width * 0.6 / 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.question_mark,
                  color: Colors.white,
                ),
                SizedBox(
                  width: width * 0.1 / 5,
                ),
                Icon(
                  Icons.person_pin,
                  color: Colors.white,
                ),
                SizedBox(
                  width: width * 0.1 / 5,
                ),
                Icon(
                  Icons.calculate,
                  color: Colors.white,
                ),
                SizedBox(
                  width: width * 0.1 / 5,
                ),
                Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
      Container(
          margin: EdgeInsets.only(right: width * 3.0 / 5),
          child: Text(
            "-0.17%",
            style: TextStyle(color: Colors.red, fontSize: 25.0),
          )),
    ],
  );
}

Widget buttons_headings(double width, double height) {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.only(left: width * 0.1 / 5),
        width: width * 1.0 / 5,
        height: height * 0.23 / 5,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
            child: Text(
              "Cross",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            )),
      ),
      Container(
        margin: EdgeInsets.only(left: width * 0.2 / 5),
        width: width * 1.0 / 5,
        height: height * 0.23 / 5,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
            child: Text(
              "20x",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            )),
      ),
      Container(
        margin: EdgeInsets.only(left: width * 0.2 / 5),
        width: width * 0.7 / 5,
        height: height * 0.23 / 5,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
            child: Text(
              "S",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            )),
      ),
      Container(
        margin: EdgeInsets.only(left: width * 0.3 / 5),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.1 / 5,
            ),
            Text(
              "Funding/Countdown",
              style: TextStyle(color: Colors.grey.shade500, fontSize: 10.0),
            ),
            Text(
              "0.0063%07:24:24",
              style: TextStyle(color: Colors.white, fontSize: 10.0),
            ),
          ],
        ),
      )
    ],
  );
}

Widget AvblText(double width, double height) {
  return Row(
    children: [
      Container(
          margin: EdgeInsets.only(left: width * 0.2 / 5),
          child: Text(
            "Avbl",
            style: TextStyle(color: Colors.white, fontSize: 26.0),
          )),
      Container(
          margin: EdgeInsets.only(left: width * 0.2 / 5),
          child: Text(
            "0.00 USDC",
            style: TextStyle(color: Colors.white, fontSize: 26.0),
          )),
      Container(
        child: Icon(
          Icons.compare_arrows,
          color: Colors.yellow,
          size: 25.0,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(

                  margin: EdgeInsets.only(
                      top: height * 0.02 / 5, left: width * 0.37 / 5),
                  child: Text(
                    "Price\n(USDC)",
                    style: TextStyle(
                        color: Colors.grey.shade500, fontSize: 12.0),
                  )),

              Column(

                children: [
                  Container(
                      margin: EdgeInsets.only(
                          top: height * 0.27 / 5, left: width * 0.2 / 5),
                      child: Text(
                        "Account",
                        style: TextStyle(
                            color: Colors.grey.shade500, fontSize: 12.0),
                      )),

                  Container(
                      margin: EdgeInsets.only(left: width * 0.2 / 5,),
                      child: Text(
                        "(USDC)",
                        style: TextStyle(
                            color: Colors.grey.shade500, fontSize: 12.0),
                      )),
                ],
              ),
            ],
          ),
        ],
      )
    ],
  );
}
// final List<String> Price = [
//   "66085.2", "66085.1", "66085.8", "66085.6", "66085.0", "66085.6", "66085.5",
// ];
// final List<String> Amount = [
//   "4.34K", "660.9", "8.26k", "35.69K", "299.88K", "4.03K", "47.78K",
// ];
Widget limitContainer(double width, double height) {
  return Column(
    children: [
      Container(
        width: width * 3.1 / 5,
        height: height * 0.3 / 5,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.info, color: Colors.white),
            ),
            Text(
              "Limit",
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_forward, color: Colors.white),
            ),

          ],
        ),
      ),
      SizedBox(height: height*0.10/5),
      Container(
        width: width * 3.1 / 5,
        height: height * 0.3 / 5,
        margin: EdgeInsets.symmetric(horizontal: width * 0.1 / 5),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.remove, color: Colors.white),
            ),
            Text(
              "66083.4",
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add, color: Colors.white),
            ),
            SizedBox(width: width * 0.3 / 5),
            Expanded(
              child: Container(
                width: width * 0.8 / 5,
                height: height * 0.3 / 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    "BBO",
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: height*0.10/5),
      Container(
        width: width * 3.0 / 5,
        height: height * 0.3 / 5,
        margin: EdgeInsets.symmetric(horizontal: width * 0.2 / 5),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.remove, color: Colors.white),
            ),
            Text(
              "Amount",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add, color: Colors.white),
            ),
            SizedBox(width: width * 0.2 / 5),
            Expanded(
              child: Container(
                width: width * 0.8 / 5,
                height: height * 0.3 / 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    "USDC",
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
