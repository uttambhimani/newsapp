import 'package:flutter/material.dart';
import 'package:newsapp/Providerclass/home_provider.dart';
import 'package:provider/provider.dart';

class Select_Screen extends StatefulWidget {
  const Select_Screen({Key? key}) : super(key: key);

  @override
  State<Select_Screen> createState() => _Select_ScreenState();
}

class _Select_ScreenState extends State<Select_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [

            Text("${Provider.of<HomeProvider>(context,listen: false).alldatalist?.title}")

          ],
        ),
      ),
    );
  }
}
