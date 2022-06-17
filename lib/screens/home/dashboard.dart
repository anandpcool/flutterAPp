import 'package:flutter/material.dart';
import 'package:iboss_flutter/screens/more/more_screen.dart';
import 'package:iboss_flutter/utils/custom_color.dart';

import 'home_page.dart';

class DashBoardPage extends StatefulWidget {
  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  int currentIndex = 0;

  final screens = [
    HomePage(),
    MorePages(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorConstants.indigoBrand,
          currentIndex: currentIndex,
          onTap: (position) => setState(() => currentIndex = position),
          type: BottomNavigationBarType.fixed,
          elevation: 4,
          selectedItemColor: ColorConstants.yellow,
          unselectedItemColor: ColorConstants.unselectedColor,
          // showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_rounded),
              //icon: Image.asset("assets/images/more.png"),//Icon(Icons.favorite),
              label: "More",
            ),
          ]),
    );
  }
}
