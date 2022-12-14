import 'package:flutter/material.dart';
import 'package:flutter_demo_app/const/colors.dart';
import 'package:flutter_demo_app/controllers/item_controller.dart';
import 'package:flutter_demo_app/models/item_model.dart';
import 'package:flutter_demo_app/widgets/counter.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../controllers/category_controller.dart';
import 'dart:math';

import '../controllers/deals_controller.dart';

class FavoritesScreen extends StatelessWidget {
  List<Color> colors = [
    const Color.fromRGBO(249, 189, 173, 1),
    // const Color.fromRGBO(176, 234, 253, 1),
    const Color.fromRGBO(255, 157, 194, 1),
    const Color.fromRGBO(204, 184, 255, 1),
  ];
  int max = 3;
  int min = 0;
  int randomNumber = 0;

  @override
  Widget build(BuildContext context) {
    DealsController dealsController = Get.find<DealsController>();
    randomNumber = Random().nextInt(2) + 0;
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
          leading: Container(),
          elevation: 0,
          backgroundColor: AppColors.appBackgroundColor,
          title: Text(
            'Favorites',
            style: TextStyle(color: Colors.black),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 20, bottom: 11.0, left: 11.0, right: 11.0),
          child:Get.find<DealsController>().getItems.isEmpty?Container(child: Center(child: Text('You Dont Have Any Favorite Item Yet')),): Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GetBuilder<DealsController>(builder: (dealsController) {
                return ListView.separated(
                  padding: const EdgeInsets.all(15),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dealsController.getItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
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
                                    color: colors[randomNumber],
                                    // border: Border.all(
                                    //     color: Color.fromRGBO(90, 112, 129, 1)),
                                  )),
                              const SizedBox(
                                width: 25,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(dealsController.getItems[index].name,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold)),
                                  Text(dealsController.getItems[index].serving,
                                      style: const TextStyle(
                                          fontSize: 8, color: Colors.grey)),
                                  Text(
                                      '\$ ' +
                                          dealsController.getItems[index].price
                                              .toString(),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color:
                                              Color.fromRGBO(177, 62, 85, 1)))
                                ],
                              ),
                              // CartCounter(index: index,)
                            ],
                          ),
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
            
            ],
          ),
        ),
      ),
    );
  }
}
