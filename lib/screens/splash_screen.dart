import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo_app/controllers/address_controller.dart';
import 'package:flutter_demo_app/screens/grocery_screen.dart';
import 'package:flutter_demo_app/widgets/bottom_nav_bar.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // ignore: unused_field
  late final _timer;

  @override
  void initState()  {
   
   
 _timer = Timer(Duration(milliseconds: 2000), () {

    Get.to(() => BottomNavBar());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var orange;
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(254, 200, 189, 1),
        child: Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        )),
      ),
    );
  }
}
