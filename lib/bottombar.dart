import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'homeScreen.dart';
import 'markets.dart';
class bottomnavbar extends StatefulWidget {
  const bottomnavbar({super.key});

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  int selectedIndex = 0;
  final List<Widget> listbottomnavdata = [
    HomeScreen(),
    marketdata(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  void navstate(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listbottomnavdata[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: navstate,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              label: "home"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/marketonclick2.png"),
                size: 25,
              ),
              label: "markets"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/tradeonclick.png"),
                size: 30,
              ),
              label: "Trades"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/featuresonclick.png"),
                size: 30,
              ),
              label: "Feature"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/walletonclick.png"),
                size: 30,
              ),
              label: "Wallets"),
        ],
      ),
    );
  }
}
