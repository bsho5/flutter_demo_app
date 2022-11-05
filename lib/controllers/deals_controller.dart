import 'package:get/get.dart';

import '../data/repository/deals_repo.dart';
import '../models/deals_model.dart';

class DealsController extends GetxController {
  final DealsRepo dealsRepo;
  List<bool> _boolList = [];
  List<bool> get boolList => _boolList;
  DealsController({required this.dealsRepo});
  List<DealsModel> _dealsList = [];
  List<DealsModel> get dealsList => _dealsList;
  Map<String?, DealsModel>? _favList = {};
  bool _isloading = false;
  bool get isloading => _isloading;
  @override
  void onInit() {
    favBoolList();
    super.onInit();
  }

  @override
  Future<void> getData() async {
    _isloading = true;
    _dealsList = [];
    update();
    Response response = await dealsRepo.getData();

    if (response.statusCode == 200) {
      _dealsList = [];

      for (var i = 0; i < response.body.length; i++) {
        _dealsList.add(DealsModel.fromMap(response.body[i]));
      }
      favBoolList();
      _isloading = false;
      update();
    }
  }

  void delete(String name) {
    _favList?.remove(name);
  }

  void favBoolList() {
    _boolList = [];
    for (var i = 0; i < dealsList.length; i++) {
      boolList.add(false);
    }
  }

  void addItemToFav(DealsModel item) {
    if (_favList!.containsKey(item.name)) {
      _favList?.update(item.name, (value) {
        return DealsModel(
          id: item.id,
          name: item.name,
          price: item.price,
          oldPrice: item.oldPrice,
          time: item.time,
          serving: item.serving,
        );
      });
    } else {
      _favList?.putIfAbsent(item.name, () {
        return DealsModel(
          id: item.id,
          name: item.name,
          price: item.price,
          oldPrice: item.oldPrice,
          time: item.time,
          serving: item.serving,
        );
      });
    }

    update();
  }

  List<DealsModel> get getItems {
    return _favList!.entries.map((e) {
      return e.value;
    }).toList();
  }
}
