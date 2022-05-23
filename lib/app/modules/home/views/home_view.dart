import 'dart:math';

import 'package:basex/app/data/dummy_data.dart';
import 'package:basex/app/styles.dart';
import 'package:basex/app/widgets/custom_app_bar.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              AppBarwithSearchBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CouponsWidget(controller: controller),
                      FrequentlyBoughtWidget(controller: controller),
                      CategoryWidget(),
                      BottomFooter()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class BottomFooter extends StatelessWidget {
  const BottomFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(top: 12.0, left: 18.0, bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Live\nit up!',
            textAlign: TextAlign.start,
            style: GoogleFonts.josefinSans(
                letterSpacing: 1.4,
                color: Colors.grey[700],
                fontSize: 42.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'Crafted with 💚✨ in Chennai, India',
            textAlign: TextAlign.start,
            style: GoogleFonts.josefinSans(color: Colors.black, fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
          child: Text(
            'Shop by category',
            style:
                GoogleFonts.nunito(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 12.0),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          child: LayoutBuilder(builder: (context, constraints) {
            return GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                addAutomaticKeepAlives: true,
                addRepaintBoundaries: true,
                addSemanticIndexes: true,
                primary: false,
                shrinkWrap: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                physics: NeverScrollableScrollPhysics(),
                itemCount: DummyData.categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 11.0,
                    crossAxisCount: 4,
                    mainAxisExtent: constraints.maxHeight * 0.5),
                itemBuilder: (context, index) {
                  final category = DummyData.categories[index];
                  return Column(children: [
                    Container(
                      height: constraints.maxHeight * 0.32,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(category.image)),
                          borderRadius: BorderRadius.circular(8.0),
                          color: Styles.kPrimaryColor.withAlpha(60)),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      category.name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ]);
                });
          }),
        )
      ],
    );
  }
}

class FrequentlyBoughtWidget extends StatelessWidget {
  final HomeController controller;
  const FrequentlyBoughtWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Frequently bought',
                style: GoogleFonts.nunito(
                    fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    'SEE ALL',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5.0),
                  Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.green,
                    size: 16.0,
                  )
                ],
              )
            ],
          ),
        ),
        Container(
            height: 280.0,
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.productList.length,
                itemBuilder: ((context, index) {
                  return ProductItemWidget(
                    index: index,
                    controller: controller,
                  );
                }))),
      ],
    );
  }
}

class CouponsWidget extends StatelessWidget {
  final HomeController controller;
  final PageController pageController = PageController(viewportFraction: 0.9);
  CouponsWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 190.0,
          child: PageView.builder(
              onPageChanged: (value) {
                controller.index.value = value;
              },
              itemCount: 5,
              controller: pageController,
              itemBuilder: (context, index) {
                return Stack(children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(left: 12.0, right: 10.0, top: 12.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [
                              0.2,
                              0.5,
                              0.8,
                              0.9
                            ],
                            colors: [
                              Colors.primaries[
                                      Random().nextInt(Colors.primaries.length)]
                                  .withAlpha(80),
                              Colors.primaries[
                                      Random().nextInt(Colors.primaries.length)]
                                  .withAlpha(80),
                              Colors.primaries[
                                      Random().nextInt(Colors.primaries.length)]
                                  .withAlpha(80),
                              Colors.primaries[
                                  Random().nextInt(Colors.primaries.length)],
                            ]),
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 25),
                        child: Icon(
                          FontAwesomeIcons.rocket,
                          color: Colors.black,
                        ),
                      )),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30.0, top: 25),
                        child: Icon(
                          FontAwesomeIcons.xbox,
                          color: Colors.black,
                        ),
                      )),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, bottom: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '50 - 80 % off',
                            style: GoogleFonts.spartan(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'use code NEWBIE200',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ]);
              }),
        ),
        SizedBox(height: 8.0),
        Obx(() {
          return DotsIndicator(
            dotsCount: 5,
            decorator: DotsDecorator(
              activeColor: Colors.green,
            ),
            onTap: (value) {
              pageController.animateToPage(value.toInt(),
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            position: controller.index.toDouble(),
          );
        }),
      ],
    );
  }
}

class AppBarwithSearchBar extends StatelessWidget {
  const AppBarwithSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      child: Container(
        color: Styles().kPrimaryColorLight,
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppBar(
              onTapLeft: () {},
              onTapRight: () {},
              title: 'Kodambakkam, Chennai',
              leftIcon: CupertinoIcons.ellipsis,
              rightIcon: CupertinoIcons.cart,
            ),
            Container(
              margin: EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
              height: 50.0,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 0.3),
                  borderRadius: BorderRadius.circular(6.0)),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search for groceries, veggies and more',
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductItemWidget extends StatelessWidget {
  final HomeController controller;
  final int index;
  const ProductItemWidget({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.0,
      width: 200.0,
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.only(right: 12.0, top: 8.0, bottom: 8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: LayoutBuilder(builder: (context, constraints) {
          final product = controller.productList[index];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.5,
                decoration: BoxDecoration(
                    color: Styles.kPrimaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          8.0,
                        ),
                        topRight: Radius.circular(8.0))),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: constraints.maxHeight * 0.04,
                      bottom: constraints.maxHeight * 0.04),
                  child: Image.asset(product.image),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: constraints.maxWidth * 0.08,
                    right: constraints.maxWidth * 0.08,
                    top: constraints.maxWidth * 0.05),
                child: Text(
                  product.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      fontFamily: GoogleFonts.openSans().fontFamily),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: constraints.maxHeight * 0.02,
                  left: constraints.maxWidth * 0.08,
                  right: constraints.maxWidth * 0.08,
                ),
                child: Row(
                  children: [
                    Text(
                      product.quantity,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                          fontFamily: GoogleFonts.openSans().fontFamily),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: constraints.maxHeight * 0.02,
                  left: constraints.maxWidth * 0.08,
                ),
                child: Row(
                  children: [
                    Text(
                      '₹' + product.price,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.openSans().fontFamily),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                        right: constraints.maxWidth * 0.04,
                      ),
                      child: Material(
                        elevation: 1.0,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        child: Obx(() {
                          return Container(
                              alignment: Alignment.center,
                              width: constraints.maxWidth * 0.5,
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]!),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: product.selectedVolume.value == 0
                                  ? GestureDetector(
                                      onTap: () {
                                        controller.addVolume(product.id);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3.0),
                                        child: Text('ADD',
                                            style: GoogleFonts.lato(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    )
                                  : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller.reduceVolume(product.id);
                                          },
                                          child: Text(
                                            '-',
                                            style: GoogleFonts.lato(
                                                fontSize: 22.0,
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                          product.selectedVolume.toString(),
                                          style: GoogleFonts.lato(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            controller.addVolume(product.id);
                                          },
                                          child: Text(
                                            '+',
                                            style: GoogleFonts.lato(
                                                fontSize: 20.0,
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ));
                        }),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
