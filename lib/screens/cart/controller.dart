import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model.dart';
import '../items/model.dart';

class CartController extends GetxController {
  final Map<String?, CartModel> _cart = {};
  int _quantity = 0;
  int get quantity => _quantity;

  void addItem(ItemModel item, int quantity) {
    if (_cart.containsKey(item.name)) {
      
      _cart.update(item.name, (value) {
        return CartModel(
          id: item.id!,
          name: item.name!,
          price: item.price!,
          count: value.count + quantity,
          serving: item.serving!,
        );
      });
    } else {
      _cart.putIfAbsent(item.name, () {
       
        return CartModel(
          id: item.id!,
          price: item.price!,
          count: quantity,
          serving: item.serving!,
          name: item.name!,
        );
      });
    }
   
    update();
  }

  void delete(String name) {
    _cart.remove(name);
  }

  void resetQuantity() {
    _quantity = 0;
    update();
  }

  void getAddedToCartSnackBar() {
    if (_quantity > 0) {
      Get.snackbar(
          'Success', 'Your Item have been successfully Added to the cart',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 2));
    }
  }

  int getQuantity(ItemModel item) {
    var quantity = 0;
    if (_cart.containsKey(item.name)) {
      _cart.forEach((key, value) {
        if (key == item.name) {
          quantity = value.count;
        }
      });
    }
    return quantity;
  }

  String getItemTotalPrice(int price, int quantity) {
    int itemTotalPrice = 0;
    itemTotalPrice = price * quantity;
    return itemTotalPrice.toString();
  }

  int get totalItems {
    var totalQuantity = 0;
    _cart.forEach((key, value) {
      totalQuantity += value.count;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _cart.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount {
    var total = 0;
    _cart.forEach((key, value) {
      total += (value.price*value.count);
    });
    return total;
  }

  bool existInCart(ItemModel item) {
    if (_cart.containsKey(item.name)) {
      return true;
    } else {
      return false;
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = _quantity + 1;
    } else {
      if (_quantity > 0) {
        _quantity = quantity - 1;
      }
    }

    update();
  }
  
}
