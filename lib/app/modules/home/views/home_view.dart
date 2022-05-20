import 'package:basex/app/styles.dart';
import 'package:basex/app/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(
          children: [
            Container(color: Styles.kPrimaryColor.withAlpha(80), height: 50.0),
            Container(
              color: Styles.kPrimaryColor.withAlpha(80),
              child: CustomAppBar(
                onTapLeft: () {},
                onTapRight: () {},
                title: 'Kodambakkam, Chennai',
                leftIcon: CupertinoIcons.ellipsis,
                rightIcon: CupertinoIcons.cart,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    color: Styles.kPrimaryColor.withAlpha(80),
                    padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'instamart',
                          style: GoogleFonts.spartan(
                              fontSize: 22.0,
                              letterSpacing: 1.1,
                              fontWeight: FontWeight.w600),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                              color: Styles.kPrimaryColor,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.flash_on_sharp,
                                size: 18.0,
                              ),
                              Text(
                                '10 - 15 mins',
                                style: GoogleFonts.openSans(
                                    letterSpacing: -.5,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Styles.kPrimaryColor.withAlpha(80),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: 12.0, left: 12.0, right: 12.0),
                          height: 50.0,
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.grey, width: 0.3),
                              borderRadius: BorderRadius.circular(6.0)),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText:
                                    'Search for groceries, veggies and more',
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Frequently bought',
                          style: GoogleFonts.lexendDeca(
                              fontSize: 18.0, fontWeight: FontWeight.w500),
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
                              color: Colors.black,
                              size: 14.0,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    height: 280.0,
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: ((context, index) {
                          return ProductItemWidget();
                        })),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    Key? key,
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
                  child: Image.asset('lib/assets/product.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: constraints.maxWidth * 0.08,
                    right: constraints.maxWidth * 0.08,
                    top: constraints.maxWidth * 0.05),
                child: Text(
                  'Baskin Robbins Honey Tub',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
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
                      '750ml',
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
                      '₹240',
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
                        child: Container(
                          width: constraints.maxWidth * 0.5,
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  '-',
                                  style: GoogleFonts.lato(
                                      fontSize: 22.0,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                '1',
                                style: GoogleFonts.lato(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  '+',
                                  style: GoogleFonts.lato(
                                      fontSize: 20.0,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
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
