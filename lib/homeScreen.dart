import 'package:flutter/Material.dart';
import 'package:flutter/widgets.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedOption;


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
              Container(
                margin: EdgeInsets.only(
                  left: width * 0.1 / 5,
                  right: width * 0.1 / 5,
                ),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.4 / 5,
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade800,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ImageIcon(
                        const AssetImage("images/Binance_Logo.png"),
                        size: width * 0.4 / 5,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.2 / 5,
                    ),
                    Expanded(
                      child: Container(
                        width: width * 1.0 / 5,
                        height: height * 0.24 / 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade700,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            fillColor: Colors.grey.shade700,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade800),
                            ),
                            hintText: "ETC",
                            hintStyle: const TextStyle(color: Colors.white),
                            contentPadding: EdgeInsets.only(
                                left: width * 0.1 / 5, right: width * 0.1 / 5),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: width * 0.1 / 5),
                      child: Row(
                        children: [
                          SizedBox(width: width * 0.13 / 5),
                          Icon(
                            Icons.center_focus_strong_sharp,
                            color: Colors.white,
                            size: width * 0.24 / 5,
                          ),
                          SizedBox(width: width * 0.13 / 5),
                          Icon(Icons.notification_important,
                              color: Colors.white, size: width * 0.24 / 5),
                          SizedBox(width: width * 0.13 / 5),
                          Icon(Icons.headphones,
                              color: Colors.white, size: width * 0.24 / 5),
                          SizedBox(width: width * 0.13 / 5),
                          Icon(Icons.payments,
                              color: Colors.white, size: width * 0.24 / 5),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.2 / 5,
              ),
              balanceText(width, height),
              SizedBox(
                height: height * 0.2 / 5,
              ),
              spotdropdown(width, height, selectedOption, (value) {
                setState(() {
                  selectedOption = value;
                });
              }),
              SizedBox(
                height: height * 0.2 / 5,
              ),
              relateddata(width, height),
            ],
          ),
        ),
      ),


    );
  }
}
Widget balanceText(double width, double height) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
          width: width * 8.7 / 5,
          margin:
              EdgeInsets.only(right: width * 0.1 / 5, left: width * 0.2 / 5),
          child: Text(
            "Total Balance (INR)",
            style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.35 / 5,
                fontWeight: FontWeight.w300),
          )),
      SizedBox(
        height: height * 0.7 / 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: width * 0.2 / 5, right: width * 0.2 / 5),
              child: Text(
                "₹4.95",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.5 / 5,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: width * 1.7 / 5),
              height: height * 0.3 / 5,
              width: width * 1.4 / 5,
              decoration: BoxDecoration(
                color: Colors.yellow.shade600,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                  child: Text(
                "Deposit",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: width * 0.25 / 5,
                    fontWeight: FontWeight.w500),
              )),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      Column(
        children: [
          IconsHome(width, height),
          SizedBox(
            height: height * 0.2 / 5,
          ),
          TextDataHeader(width, height),
        ],
      ),
    ],
  );
}

Widget IconsHome(double width, double height) {
  const List<Map<String, dynamic>> iconData = [
    {"icon": Icons.payments, "name": "Deposit"},
    {"icon": Icons.person, "name": "Referral"},
    {"icon": Icons.insert_chart, "name": "Trading Bots"},
    {"icon": Icons.menu, "name": "Orders"},
    {"icon": Icons.compare_arrows, "name": "Transfer"},
    {"icon": Icons.more_horiz, "name": "more"},
  ];
  return Container(
    margin: EdgeInsets.symmetric(horizontal: width * 0.1 / 5),
    child: Wrap(
      spacing: width * 0.4 / 5,
      runSpacing: height * 0.2 / 5,
      alignment: WrapAlignment.start,
      children: iconData.map((data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                print('Button tapped: ${data['name']}');
              },
              icon: Container(
                width: width * 0.6 / 5,
                height: height * 0.3 / 5,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade700),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  data['icon'],
                  color: Colors.yellow.shade700,
                  size: width * 0.25 / 5,
                ),
              ),
            ),
            SizedBox(height: height * 0.10 / 5),
            Text(data['name'],
                style:
                    TextStyle(fontSize: width * 0.15 / 5, color: Colors.white)),
          ],
        );
      }).toList(),
    ),
  );
}

Widget TextDataHeader(double width, double height) {
  return Container(
    margin: EdgeInsets.only(left: width * 0.2 / 5, right: width * 0.2 / 5),
    child: Row(
      children: [
        Text(
          "Favorites",
          style: TextStyle(color: Colors.white, fontSize: width * 0.18 / 5),
        ),
        SizedBox(
          width: width * 0.3 / 5,
        ),
        Text(
          "Hot",
          style: TextStyle(color: Colors.white, fontSize: width * 0.18 / 5),
        ),
        SizedBox(
          width: width * 0.3 / 5,
        ),
        Text(
          "Gainers",
          style: TextStyle(color: Colors.white, fontSize: width * 0.18 / 5),
        ),
        SizedBox(
          width: width * 0.3 / 5,
        ),
        Text(
          "Losers",
          style: TextStyle(color: Colors.white, fontSize: width * 0.18 / 5),
        ),
        SizedBox(
          width: width * 0.3 / 5,
        ),
        Text(
          "New Greeting",
          style: TextStyle(color: Colors.white, fontSize: width * 0.18 / 5),
        ),
      ],
    ),
  );
}

Widget spotdropdown(double width, double height, String? selectedOption,
    void Function(String?) onChanged) {
  final List<String> dropdownData = [
    "option1",
    "option2",
    "option3",
    "option4"
  ];
  return Row(
    children: [
      Container(
        margin: EdgeInsets.only(
            top: height * 0.2 / 5,
            left: width * 0.2 / 5,
            right: width * 0.2 / 5),
        width: width * 1.7 / 5,
        height: 0.2 / 5,
        color: Colors.grey,
        child: DropdownButton(
          onChanged: (value) {
            onChanged(value as String?);
            print("hii");
          },
          value: selectedOption,
          items: dropdownData.map((String option) {
            return DropdownMenuItem(
              value: option,
              child: Text(
                option,
                style: const TextStyle(color: Colors.white, fontSize: 10.0),
              ),
            );
          }).toList(),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: width * 0.6 / 5),
        child: Text(
          " Last Price",
          style: TextStyle(color: Colors.grey.shade300),
        ),
      ),
      SizedBox(
        width: width * 0.3 / 5,
      ),
      Container(
        child: Text(
          " 24h chg%",
          style: TextStyle(color: Colors.grey.shade300),
        ),
      ),
    ],
  );
}


final List<Map<String, String>> data = [
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

Widget relateddata(double width, double height) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children: data.map((item) {
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
                  Text(item["text1"]!,
                      style: TextStyle(
                          color: Colors.white, fontSize: width * 0.30 / 5)),
                  SizedBox(width: 0.01/5,),
                  Text(item["text2"]!,
                      style: TextStyle(
                          color: Colors.grey.shade600, fontSize: width * 0.22 / 5)),
                ],
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(left: width * 0.1 / 5),
            //   child: Text(item["text2"]!,
            //       style: TextStyle(
            //           color: Colors.grey.shade300,
            //           fontSize: width * 0.25 / 5)),
            // ),
            Container(
              width: width * 0.5/ 5,
              height: height * 0.15 / 5,

              decoration: BoxDecoration(
                color: Colors.grey.shade700,
              ),
              child: Center(
                child: Text(item["text3"]!,
                    style: TextStyle(
                        color: Colors.white, fontSize: width * 0.2 / 5)),
              ),
            ),
            Container(
              width: width*1.1/6,
              margin: EdgeInsets.only(left: width * 0.3 / 5),
              child: Text(item["price"]!,
                  style: const TextStyle(color: Colors.white)),
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
                child: Text(item["percentage"]!,
                    style:  TextStyle(color: Colors.white)),
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
  );
}
