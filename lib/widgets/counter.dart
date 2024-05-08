import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/cart/controller.dart';

class CartCounter extends StatelessWidget {
  final int index;

  const CartCounter({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 33,
                width: 33,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(175, 232, 251, 1),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: IconButton(
                    onPressed: () {
                      if (controller.getItems[index].count > 1) {
                        controller.getItems[index].count =
                            controller.getItems[index].count - 1;
                        controller.totalItems;
                        
                        controller.update();
                    
                      } else {
                        controller.delete(controller.getItems[index].name);
                        controller.totalItems;
                       
                        controller.update();
                       
                        
                      }
                      controller.update();
                    },
                    icon: const Icon(Icons.remove_circle_outline, color: Colors.white)),
              ),
              Container(
                alignment: Alignment.center,
                // width: 30,
                child: Text(
                  controller.getItems[index].count.toString(),
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(175, 232, 251, 1),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: IconButton(
                    onPressed: () {
                      controller.getItems[index].count =
                          controller.getItems[index].count + 1;
                      
                      controller.totalItems;
                      controller.update();
                     
                    },
                    icon: const Icon(Icons.add_circle_outline, color: Colors.white)),
              )
            ],
          ),
        ),
      );
    });
  }
}
