import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model_class/NewsModel.dart';


class HomeProvider extends ChangeNotifier{

Articles? alldatalist;
  String SearchData="india";

  int i=0;

  void changes(int index)
  {
    i = index;
    notifyListeners();
  }


 void changData(String newData){

    SearchData = newData;
    notifyListeners();
 }



  Future<NewsModel> apicalling(String data)async{

    String applink="https://newsapi.org/v2/everything?q=$data&from=${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}&sortBy=publishedAt&apiKey=d8d508328375470bbcbce669d3b14a05";


    var jsonString = await http.get(Uri.parse(applink));

    var json = jsonDecode(jsonString.body);

    return NewsModel.fromJson(json);
  }

}