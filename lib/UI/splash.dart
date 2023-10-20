import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:task10/UI/dashboard.dart';
import 'package:task10/UI/log_in.dart';

import '../utils/SHDFClass.dart';
import '../utils/constants.dart';

class Splash_Screen extends StatefulWidget {
  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen>
    with WidgetsBindingObserver {
  var bannerPosition = 0;
  int imgnumber = 1;



  @override
  void initState() {

    if (this.mounted) {
      handleSession(context);
    }
    super.initState();
  }



  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: "Task10",
                  theme: ThemeData.light(),
                  home: Scaffold(
                      body: Container(
                        // width: MediaQuery.of(context).size.height/1.5,
                        decoration: BoxDecoration(
                          // color: Color(0XFFf1dae9),
                          // color: Color(0XFFf8ecf4),
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(
                              "assets/images/background.jpg",
                            ),
                            // fit: BoxFit.fill,
                          ),
                          // gradient: LinearGradient(
                          //   colors: <Color>[
                          //     Color(0XFFF55151),
                          //     Color(0xffdda1c7),
                          //     Color(0xffc969a6),
                          //   ],
                          // ),
                        ),
                      )
                    // Container(

                  )); // MyHomePage());
            },
          );
        },
      );
    });
  }

  handleSession(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? Session = preferences.getBool(AppConstants.Session); //preferences.getBool("session");==true
    print(Session);


    String? userid =
    await SHDFClass.readSharedPrefString(AppConstants.UserId, "");

    if (Session == true) {
      Future.delayed(Duration(seconds: 3), () {
        if (userid != "" || userid != null) {
          Navigator.of(context).pushAndRemoveUntil(
              new MaterialPageRoute(
                builder: (context) => DashBoard(),
              ),
                  (route) => false);
        }
      });
    } else {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(
              builder: (context) => Log_in(),
            ),
                (route) => false);
      });
      // // }
    }
  }
}