import 'package:flutter/material.dart';

class TabBarText extends StatefulWidget {
  const TabBarText({Key? key});

  @override
  State<TabBarText> createState() => _TabBarTextState();
}

class _TabBarTextState extends State<TabBarText> {
  final List<String> marketdatabar = ["Favorite", "Market", "Square", "Data"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: marketdatabar.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black, // Customize the app bar color
          bottom: TabBar(
            isScrollable: true, // Allow scrolling if there are many tabs
            tabs: marketdatabar.map((data) {
              return Tab(
                child: Text(
                  data,
                  style: TextStyle(color: Colors.white),
                ),
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: marketdatabar.map((data) {
            return Center(
              child: Text(
                data, // Replace with your content for each tab
                style: TextStyle(fontSize: 24.0),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}