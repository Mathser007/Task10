

import 'package:flutter/material.dart';
import 'package:task10/UI/splash.dart';

void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/":(context)=>Splash_Screen()
      },
    );
  }
}
