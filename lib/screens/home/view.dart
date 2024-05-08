import 'package:flutter/material.dart';
import 'package:flutter_demo_app/const/colors.dart';
import 'package:flutter_demo_app/screens/items/view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../address/controller.dart';
import 'controller.dart';
import '../deals/controller.dart';

// ignore: must_be_immutable
class GroceryScreen extends StatelessWidget {
  List<Color> colors = [
    const Color.fromRGBO(249, 189, 173, 1),
    const Color.fromRGBO(250, 217, 109, 1),
    const Color.fromRGBO(204, 184, 255, 1),
    const Color.fromRGBO(176, 234, 253, 1),
    const Color.fromRGBO(255, 157, 194, 1)
  ];
  List<Color> dealsColors = [
    const Color.fromRGBO(249, 189, 173, 1),
    const Color.fromRGBO(250, 217, 109, 1),
  ];

  GroceryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Get.find<AddressController>().isloading
          ? Container()
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GetBuilder<AddressController>(builder: (addressController) {
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
                        height: 20,
                      ),
                      Container(
                        height: 45,
                        width: 347,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(245, 247, 249, 1),
                          border: Border.all(color: const Color.fromRGBO(161, 161, 161, 1)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              SizedBox(
                                width: 18,
                              ),
                              Text(
                                'Search in thousands of products',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 49,
                        child: Column(
                          children: [
                            Expanded(
                              child: GetBuilder<AddressController>(builder: (addressController) {
                                return ListView.separated(
                                  separatorBuilder: (BuildContext context, int index) {
                                    return Container(
                                      width: 25,
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                  // shrinkWrap: true,
                                  itemCount: addressController.addressList.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      height: 49,
                                      width: 167,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: const Color.fromRGBO(230, 230, 230, 1)),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(7.0),
                                            child: Container(
                                                height: 34,
                                                width: 34,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5), color: const Color.fromRGBO(227, 221, 217, 1)
                                                    // border: Border.all(
                                                    //     color: Color.fromRGBO(90, 112, 129, 1)),
                                                    )),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                '${addressController.addressList[index].type} Address',
                                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 100,
                                                    child: Text(
                                                      addressController.addressList[index].fullAddress,
                                                      style: const TextStyle(fontSize: 10),
                                                      softWrap: true,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Explore by Category',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'See All (36)',
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 100,
                        child: Column(
                          children: [
                            Expanded(
                              child: GetBuilder<CategoryController>(builder: (categoryController) {
                                return ListView.separated(
                                  separatorBuilder: (BuildContext context, int index) {
                                    return Container(
                                      width: 25,
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                  // shrinkWrap: true,
                                  itemCount: categoryController.categoryList.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () => Get.to(() => ItemsScreen(
                                            items: categoryController.categoryList[index].items!,
                                            categoryName: categoryController.categoryList[index].name!,
                                          )),
                                      child: Column(
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
                                            height: 6,
                                          ),
                                          Text(categoryController.categoryList[index].name ?? '',
                                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Deals of the day',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 90,
                        child: Column(
                          children: [
                            Expanded(
                              child: GetBuilder<DealsController>(builder: (dealsController) {
                                return ListView.separated(
                                  separatorBuilder: (BuildContext context, int index) {
                                    return Container(
                                      width: 25,
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                  // shrinkWrap: true,
                                  itemCount: dealsController.dealsList.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                                height: 90,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: dealsColors[index],
                                                  // border: Border.all(
                                                  //     color: Color.fromRGBO(90, 112, 129, 1)),
                                                )),
                                            GestureDetector(
                                              onTap: () {
                                                if (dealsController.boolList[index] == false) {
                                                  dealsController.boolList[index] = true;
                                                  dealsController.addItemToFav(dealsController.dealsList[index]);

                                                  dealsController.update(['heart icon']);
                                                } else {
                                                  dealsController.boolList[index] = false;
                                                  dealsController.delete(dealsController.dealsList[index].name);

                                                  dealsController.update(['heart icon']);
                                                }
                                              },
                                              child: GetBuilder<DealsController>(
                                                  id: 'heart icon',
                                                  builder: (dealsController) {
                                                    return Container(
                                                      height: 24,
                                                      width: 24,
                                                      decoration: BoxDecoration(
                                                          color: AppColors.appBackgroundColor, borderRadius: BorderRadius.circular(100)),
                                                      child: dealsController.boolList[index] == false
                                                          ? const Icon(
                                                              FontAwesomeIcons.heart,
                                                              size: 15,
                                                            )
                                                          : const Icon(FontAwesomeIcons.solidHeart, size: 15, color: Colors.red),
                                                    );
                                                  }),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                dealsController.dealsList[index].name,
                                                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                              ),
                                              Text(dealsController.dealsList[index].serving, style: const TextStyle(fontSize: 10)),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.location_on_outlined,
                                                    size: 10,
                                                  ),
                                                  Text('${dealsController.dealsList[index].time} Minutes Away', style: const TextStyle(fontSize: 10))
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '\$ ${dealsController.dealsList[index].price}',
                                                    style: const TextStyle(color: Color.fromRGBO(238, 106, 97, 1), fontWeight: FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    '\$ ${dealsController.dealsList[index].oldPrice}',
                                                    style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 346,
                        height: 131,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color.fromRGBO(254, 200, 189, 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 0, left: 22, right: 12, top: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 1,
                              ),
                              Image.asset('assets/images/offer.png'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
