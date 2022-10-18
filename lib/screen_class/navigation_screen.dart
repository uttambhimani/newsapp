import 'package:flutter/material.dart';
import 'package:newsapp/Providerclass/home_provider.dart';
import 'package:newsapp/screen_class/news_screen.dart';
import 'package:newsapp/screen_class/profil_screen.dart';
import 'package:newsapp/screen_class/vidio_screen.dart';
import 'package:provider/provider.dart';

import 'tab_screen.dart';

class Navigation_Screen extends StatefulWidget {
  const Navigation_Screen({Key? key}) : super(key: key);

  @override
  State<Navigation_Screen> createState() => _Navigation_ScreenState();
}

class _Navigation_ScreenState extends State<Navigation_Screen> {
  List<Widget> wigetList=[Tab_Screen(),Profile_Scrren(),Profile_Scrren()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: wigetList[Provider.of<HomeProvider>(context,listen: false).i],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black38,
            onTap: (valu){
              Provider.of<HomeProvider>(context,listen: false).changes(valu);
            },
            currentIndex: Provider.of<HomeProvider>(context,listen: true).i,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.play_circle_outline_sharp),label: "Vidio"),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
            ],
          ),
      ),
    );
  }
}
