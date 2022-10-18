import 'dart:async';

import 'package:flutter/material.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  List img=["assets/newsgif.gif"];
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, 'nv');
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Image.asset("assets/newsgif.gif",fit: BoxFit.fitWidth,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
