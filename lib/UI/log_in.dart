import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/log_in_controller.dart';

class Log_in extends StatefulWidget {
  const Log_in({super.key});

  @override
  State<Log_in> createState() => _Log_inState();
}

class _Log_inState extends State<Log_in> {
  final LoginController _getXController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _getXController.txtEmail,
            decoration: const InputDecoration(
              hintText: 'Enter your name',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black
                )

              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
                )
              )
              ),
          TextFormField(
              controller: _getXController.txtPassword,
              decoration: const InputDecoration(
                  hintText: 'Password',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black
                      )

                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                  )
              )
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: (){
            _getXController.checkLoginValidations(context);

          },child: Text("Submit"),)

        ],
      ),


    );
  }
}
