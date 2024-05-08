import 'package:flutter/Material.dart';
import 'package:myapplication2/Trades.dart';
import 'package:myapplication2/WalletScreen.dart';
import 'homeScreen.dart';
import 'markets.dart';
import 'feature.dart';
class bottomnavbar extends StatefulWidget {
  const bottomnavbar({super.key});
  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  int selectedIndex = 0;
  final List<Widget> listbottomnavdata = [
    HomeScreen(),
    cryptoData (),
    TradesScreen(),
    FeatureScreen(),
    walletsScreen(),
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
        iconSize: 50,
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/home onclick.png"),

              ),
              label: "home"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/marketonclick2.png"),

              ),
              label: "markets"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/tradesonclick.png"),

              ),
              label: "Trades"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/featuresonclick.png"),

              ),
              label: "Feature"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/walletonclick.png"),

              ),
              label: "Wallets"),
        ],
      ),
    );
  }
}

