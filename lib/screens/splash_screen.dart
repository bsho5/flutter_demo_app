import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo_app/widgets/bottom_nav_bar.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'SplashScreen';

  const SplashScreen({super.key});

  @override
   State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // ignore: unused_field
  late final Timer _timer;

  @override
  void initState()  {
   
   
 _timer = Timer(const Duration(milliseconds: 2000), () {

    Get.to(() => const BottomNavBar());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(254, 200, 189, 1),
        child: const Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        )),
      ),
    );
  }
}
