import 'package:get/get.dart';

import 'repo.dart';
import 'model.dart';

class AddressController extends GetxController {
  final AddressRepo addressRepo;

  AddressController({required this.addressRepo});
  List<AddressModel> _addressList = [];
  List<AddressModel> get addressList => _addressList;
  bool _isloading = false;
  bool get isloading => _isloading;

  Future<void> getData() async {
    _isloading = true;
 
    Response response = await addressRepo.getData();
   
    if (response.statusCode == 200) {
      _addressList = [];

      for (var i = 0; i < response.body.length; i++) {
        _addressList.add(AddressModel.fromMap(response.body[i]));
      }
      _isloading = false;
      update();
    }
    _isloading = false;
     update();
  }
}
