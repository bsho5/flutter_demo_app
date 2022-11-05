import 'package:flutter_demo_app/models/item_model.dart';
import 'package:get/get.dart';

import '../data/repository/category_repo.dart';
import '../models/category_model.dart';

class CategoryController extends GetxController {
  final CategoryRepo categoryRepo;

  CategoryController({required this.categoryRepo});
  List<CategoryModel> _categoryList = [];
  List<CategoryModel> get categoryList => _categoryList;
  late ItemModel _currentItem;
  ItemModel get currentItem => _currentItem;

  bool _isloading = false;
  bool get isloading => _isloading;

  Future<void> getData() async {
    _isloading = true;
    update();
    Response response = await categoryRepo.getData();
   
    if (response.statusCode == 200) {
      _categoryList = [];

      for (var i = 0; i < response.body.length; i++) {
        _categoryList.add(CategoryModel.fromJson(response.body[i]));
      }
      _isloading = false;
      update();
    }
   
  }
}
