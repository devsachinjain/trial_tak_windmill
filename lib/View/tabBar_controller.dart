import 'package:flutter/material.dart';
import 'package:trial_task/View/fav.dart';
import 'package:trial_task/View/home_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.blueGrey[900],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.currency_bitcoin),
                text: "Crypto",
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: "favourite",
              ),
           
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            Center(
              child: HomeScreen(),
            ),
            Center(
              child: FavScreen(),
            ),
           
          ],
        ),
      ),
    );
  }
}