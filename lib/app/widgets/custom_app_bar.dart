import 'package:badges/badges.dart';
import 'package:basex/app/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bordered_box_button.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback onTapLeft;
  final VoidCallback onTapRight;
  final String title;
  final String? badgeCount;
  final IconData leftIcon;
  final IconData rightIcon;
  const CustomAppBar(
      {Key? key,
      required this.onTapLeft,
      required this.onTapRight,
      required this.leftIcon,
      required this.rightIcon,
      required this.title,
      this.badgeCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BorderedBoxButton(onTap: onTapLeft, icon: leftIcon),
          Row(
            children: [
              Icon(
                CupertinoIcons.location_fill,
                color: Styles.kPrimaryColor,
              ),
              SizedBox(width: 5.0),
              Text(
                title,
                style: TextStyle(
                    fontFamily: GoogleFonts.nunito().fontFamily,
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          badgeCount != null
              ? Badge(
                  badgeColor: Styles.kPrimaryColor,
                  badgeContent: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      badgeCount!,
                      style: GoogleFonts.spartan(
                          fontSize: 10.0, color: Colors.black),
                    ),
                  ),
                  child: BorderedBoxButton(onTap: onTapRight, icon: rightIcon))
              : BorderedBoxButton(onTap: onTapRight, icon: rightIcon)
        ],
      ),
    );
  }
}
