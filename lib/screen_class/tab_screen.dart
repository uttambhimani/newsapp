import 'package:flutter/material.dart';
import 'package:newsapp/Providerclass/home_provider.dart';
import 'package:newsapp/screen_class/news_screen.dart';
import 'package:newsapp/screen_class/vidio_screen.dart';
import 'package:provider/provider.dart';

class Tab_Screen extends StatefulWidget {
  const Tab_Screen({Key? key}) : super(key: key);

  @override
  State<Tab_Screen> createState() => _HomeState();
}

class _HomeState extends State<Tab_Screen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          bottom:   TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            tabs: [
              Tab(text: "TOP NEWS"),
              Tab(text: "INDIA"),
              Tab(text: "HEALTH"),
              Tab(text: "BUSINESS"),
              Tab(text: "SPORTS"),
              Tab(text: "ELECTION"),
            ],
          ),
          actions: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, 'tx');
            }, icon: Icon(Icons.search),color: Colors.white,),

            SizedBox(width: 25,),
            PopupMenuButton(itemBuilder: (context){
              return[
                PopupMenuItem(child: Text("Manu")),
                PopupMenuItem(child: Text("Setting")),
                PopupMenuItem(child: Text("Logout")),
              ];
            },
            ),
          ],
        ),
        drawer: Drawer(),
        body: Column(
          children: const [
            Expanded(
              child: TabBarView(
                children: [
                News_Screen(),
                News_Screen(),
                News_Screen(),
                News_Screen(),
                News_Screen(),
                News_Screen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
