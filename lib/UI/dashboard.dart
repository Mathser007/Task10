import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task10/UI/log_in.dart';
import 'package:task10/utils/constants.dart';
import '../utils/SHDFClass.dart';
class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}
String username="";
String password="";

class _DashBoardState extends State<DashBoard> {
  void initState() {

    username="";
    password="";
setState(() {

});
      super.initState();


  }


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 100,width: 200,
              color: Colors.blueGrey,

           child: Center(child: Column(
             children: [
               Text(username,style: TextStyle(color: Colors.yellow)),
               SizedBox(height: 10,)
,               Text(password,style: TextStyle(color: Colors.yellow)),
             ],
           ),),
            ),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: (){
              SHDFClass.clearall();
              Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(
                    builder: (context) => Log_in(),
                  ),
                      (route) => false);
            },child: Text("Logout"),) ,
          SizedBox(height: 20.0,),
          MaterialButton(
            color: Colors.blue,
            onPressed: ()async{
              username =
                  await SHDFClass.readSharedPrefString(AppConstants.userid, "") ?? "";
              password =
                  await SHDFClass.readSharedPrefString(AppConstants.password, "") ?? "";
              setState(() {

              });
            },child: Text("show value"),)
        ],
      ),
    );
  }
}
