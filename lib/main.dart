import 'package:flutter/material.dart';
import 'package:newsapp/Providerclass/home_provider.dart';
import 'package:newsapp/Providerclass/postapi_provider.dart';
import 'package:newsapp/screen_class/select_news.dart';
import 'package:newsapp/screen_class/splesh_screen.dart';
import 'package:newsapp/screen_class/tab_screen.dart';
import 'package:newsapp/screen_class/navigation_screen.dart';
import 'package:newsapp/screen_class/news_screen.dart';
import 'package:newsapp/screen_class/profil_screen.dart';
import 'package:newsapp/screen_class/textfild_screen.dart';
import 'package:newsapp/screen_class/vidio_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider(create: (context)=>HomeProvider()),
        ListenableProvider(create: (context)=>postapiprovidre()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'sp',
        routes: {
          '/':(context)=>Tab_Screen(),
          'news':(context)=>News_Screen(),
          'vidio':(context)=>Vidio_Screen(),
          'prifil':(context)=>Profile_Scrren(),
          'nv':(context)=>Navigation_Screen(),
          'tx':(context)=>Textfild_Screen(),
          'sp':(context)=>SpleshScreen(),
          'st':(context)=>Select_Screen(),
        }
      ),
    ),
  );
}