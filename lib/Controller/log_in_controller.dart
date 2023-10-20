
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:task10/UI/dashboard.dart';
import 'package:task10/Utils/colors.dart';

import '../utils/SHDFClass.dart';
import '../utils/constants.dart';

class LoginController extends GetxController {
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtEmailFP = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  final TextEditingController txtUserName = TextEditingController();
  final TextEditingController txtNewPass = TextEditingController();
  final TextEditingController txtNewPassconfirm = TextEditingController();
  int activeIndexlist = 0;
  var substrings;
  RxString value1 = "".obs;
  RxString value2 = "".obs;
  RxString dashboard_name ="".obs; //ModalClass.Home;
  FocusNode focusEmail = FocusNode();
  FocusNode focusEmail1 = FocusNode();
  FocusNode focusPassword = FocusNode();

  checkLoginValidations(BuildContext context) {
    if (txtEmail.text.length == 0 || txtPassword.text.length == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context1) => AlertDialog(
            actions: [
              Column(
                children: [
                  Image.asset("assets/images/warning.jpg"),
                ],
              )
              
            ],

            backgroundColor: Appcolor.containercolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
            ),
            // actions: [Image.asset("assets/images/background.jpg")],
          ));
    } else if (!EmailValidator.validate(txtEmail.text)) {
      showDialog(
          context:context,
          builder: (BuildContext context1) => AlertDialog(

            actions: [Image.asset("assets/images/background.jpg")],
          ));
    } else {
      SHDFClass.saveSharedPrefValueBoolean(
          AppConstants.Session, true);//// to save session
      SHDFClass.saveSharedPrefValueString(
          AppConstants.userid, txtEmail.text.toString());/// to save userid
      SHDFClass.saveSharedPrefValueString(
          AppConstants.password, txtPassword.text.toString());////// tosave password
      //	then go to dashboard
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(
            builder: (context) => DashBoard(),
          ),
              (route) => false);
    }
  }



}