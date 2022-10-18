import 'package:flutter/material.dart';
import 'package:newsapp/Providerclass/postapi_provider.dart';
import 'package:provider/provider.dart';

class Profile_Scrren extends StatefulWidget {
  const Profile_Scrren({Key? key}) : super(key: key);

  @override
  State<Profile_Scrren> createState() => _Profile_ScrrenState();
}

class _Profile_ScrrenState extends State<Profile_Scrren> {

   TextEditingController txt_name = TextEditingController();
  TextEditingController txt_job = TextEditingController();
   var txtkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: txtkey,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: txt_name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Enter name"),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter Name';
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: txt_job,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Enter Namber"),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter Namber';
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(onPressed: () async{

                    if(txtkey.currentState!.validate()==true){

                      bool isSuccess= await Provider.of<postapiprovidre>(context,listen: false).postapiCall(txt_name.text,txt_job.text);
                      if(isSuccess){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Success")));
                      }
                      else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Failed")));

                      }
                    }

                  }, child: Text("Save")),

                  // ElevatedButton(onPressed: () async{
                  //   bool isSuccess= await Provider.of<postapiprovidre>(context,listen: false).postapiCall("uttam","flutter");
                  //   if(isSuccess){
                  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Success")));
                  //   }
                  //   else
                  //   {
                  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Failed")));
                  //
                  //   }
                  //
                  // }, child: Text("Save")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
