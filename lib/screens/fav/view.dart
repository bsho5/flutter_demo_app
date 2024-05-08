import 'package:flutter/material.dart';
import 'package:flutter_demo_app/const/colors.dart';
import 'package:get/get.dart';
import 'dart:math';

import '../address/controller.dart';
import '../deals/controller.dart';

// ignore: must_be_immutable
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

  FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    randomNumber = Random().nextInt(2) + 0;
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      // appBar: AppBar(
      //     leading: Container(),
      //     elevation: 0,
      //     backgroundColor: AppColors.appBackgroundColor,
      //     title: const Text(
      //       'Favorites',
      //       style: TextStyle(color: Colors.black),
      //     )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 20, bottom: 11.0, left: 11.0, right: 11.0),
          child:
          Column(
            children: [

                      const _TopBar(),
                const SizedBox(
                  height: 30,
                ),
          
              Get.find<DealsController>().getItems.isEmpty?const Expanded(child: Center(child: Text('You Don\'t Have Any Favorite Item Yet'))): 
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [  
                  GetBuilder<DealsController>(builder: (dealsController) {
                    return ListView.separated(
                      padding: const EdgeInsets.all(15),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: dealsController.getItems.length,
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
                                          '\$ ${dealsController.getItems[index].price}',
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
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Row(
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
                );
  }
}
