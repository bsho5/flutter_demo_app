import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/colors.dart';
import '../address/controller.dart';
import 'controller.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  List<Color> colors = [
    const Color.fromRGBO(249, 189, 173, 1),
    const Color.fromRGBO(176, 234, 253, 1),
    const Color.fromRGBO(255, 157, 194, 1),
    const Color.fromRGBO(204, 184, 255, 1),
    const Color.fromRGBO(249, 189, 173, 1),
  ];

  CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
           
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30.0),
                    ),
                    // shape: BeveledRectangleBorder(
                    //   // side: BorderSide(color: Colors.blue),

                    // ),
                    child: GetBuilder<AddressController>(builder: (addressController) {
                      return ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30.0),
                        ),
                        // shape: BeveledRectangleBorder(
                        //   // side: BorderSide(color: Colors.blue),

                        // ),
                        child: Container(
                          width: 122.95,
                          height: 34,
                          decoration: const BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50.0), bottomLeft: Radius.circular(50.0), bottomRight: Radius.circular(30.0))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 18,
                                  color: Colors.white,
                                ),
                                Text(
                                  addressController.addressList[0].street,
                                  style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: const Color.fromRGBO(90, 112, 129, 1)),
                      ))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              
              Get.find<CartController>().getItems.isEmpty
                  ? const Expanded(
                     
                      child: Center(child: Text('You Don\'t Have Any Items In Your Cart Yet')),
                    )
                  : SingleChildScrollView(
                    child: GetBuilder<CartController>(builder: (cartController) {
                        return ListView.separated(
                          padding: const EdgeInsets.all(15),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cartController.getItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 56,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          height: 56,
                                          width: 56,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: colors[index],
                                            // border: Border.all(
                                            //     color: Color.fromRGBO(90, 112, 129, 1)),
                                          )),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(cartController.getItems[index].name,
                                              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                                          Text(cartController.getItems[index].serving, style: const TextStyle(fontSize: 8, color: Colors.grey)),
                                          Text(
                                              '\$ ${cartController.getItemTotalPrice(cartController.getItems[index].price, cartController.getItems[index].count)}',
                                              style: const TextStyle(fontSize: 15, color: Color.fromRGBO(177, 62, 85, 1)))
                                        ],
                                      ),
                                      // CartCounter(index: index,)
                                    ],
                                  ),
                                  GetBuilder<CartController>(builder: (cartController) {
                                    return SizedBox(
                                      height: 33,
                                      width: 111,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 33,
                                            width: 33,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: const Color.fromRGBO(176, 234, 253, 1),
                  
                                              // border: Border.all(
                                              //     color: Color.fromRGBO(90, 112, 129, 1)),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                if (cartController.getItems[index].count == 1) {
                                                  cartController.delete(cartController.getItems[index].name);
                                                } else {
                                                  cartController.getItems[index].count--;
                                                }
                                                cartController.update();
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                color: Color.fromRGBO(71, 182, 218, 1),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            cartController.getItems[index].count.toString(),
                                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            height: 33,
                                            width: 33,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: const Color.fromRGBO(176, 234, 253, 1),
                                              // border: Border.all(
                                              //     color: Color.fromRGBO(90, 112, 129, 1)),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                cartController.getItems[index].count++;
                  
                                                cartController.update();
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                color: Color.fromRGBO(71, 182, 218, 1),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  })
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 35,
                            );
                          },
                        );
                      }),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
