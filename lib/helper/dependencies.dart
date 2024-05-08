import 'package:flutter_demo_app/screens/deals/repo.dart';
import 'package:get/instance_manager.dart';

import '../const/constants.dart';
import '../screens/address/controller.dart';
import '../screens/cart/controller.dart';
import '../screens/home/controller.dart';
import '../screens/deals/controller.dart';
import '../screens/items/controller.dart';
import '../api/api_client.dart';
import '../screens/address/repo.dart';
import '../screens/home/repo.dart';
// import '../data/repository/item_repo.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repo
  Get.lazyPut(() => CategoryRepo(apiClient: Get.find()));

  // Get.lazyPut(() => ItemRepo(apiClient: Get.find()));

  Get.lazyPut(() => AddressRepo(apiClient: Get.find()));
  Get.lazyPut(() => DealsRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => CategoryController(categoryRepo: Get.find()));

  Get.lazyPut(() => ItemController());
  Get.lazyPut(() => CartController());
   Get.lazyPut(() => DealsController(dealsRepo: Get.find()));

  Get.lazyPut(() => AddressController(addressRepo: Get.find()));
}
