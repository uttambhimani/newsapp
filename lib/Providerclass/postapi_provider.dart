import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class postapiprovidre extends ChangeNotifier{

  String postapilink ="https://reqres.in/api/users";

  Future<bool> postapiCall(String name,String job)async{

    var jsonString =await http.post(Uri.parse(postapilink),body: {"name":"$name","job":"$job"});

    // var json = jsonDecode(jsonString.body);

    if(jsonString.statusCode>=200 && jsonString.statusCode<400){

      return true;
    }
    else{

      return false;
    }

  }

}