import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_app/controllers/address_controller.dart';
import 'package:flutter_demo_app/controllers/cart_controller.dart';
import 'package:flutter_demo_app/screens/splash_screen.dart';
import 'package:flutter_demo_app/widgets/bottom_nav_bar.dart';
import 'package:get/get.dart';
import 'controllers/category_controller.dart';
import 'controllers/deals_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<AddressController>().getData();
    Get.find<CategoryController>().getData();
    Get.find<DealsController>().getData();
    Get.find<DealsController>().favBoolList();
    Get.find<CartController>();
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
