import 'package:flutter_demo_app/data/repository/deals_repo.dart';
import 'package:get/instance_manager.dart';

import '../const/constants.dart';
import '../controllers/address_controller.dart';
import '../controllers/cart_controller.dart';
import '../controllers/category_controller.dart';
import '../controllers/deals_controller.dart';
import '../controllers/item_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/address_repo.dart';
import '../data/repository/category_repo.dart';
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
