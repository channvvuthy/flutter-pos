// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constants/color.dart';

class Rectangle extends StatelessWidget {
  final int total;
  final String description;
  final bool isPercentage;
  final VoidCallback? onPress;
  final Color bgColor;
  final Color footerColor;
  final String assetIcon;

  const Rectangle(
      {super.key,
      required this.total,
      this.isPercentage = false,
      required this.description,
      this.onPress,
      this.bgColor = cyan,
      this.footerColor = cyanDark,
      required this.assetIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  children: [
                    Text(
                      total.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 35.2),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      description,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              )),
              Expanded(
                  child: SvgPicture.asset(
                assetIcon,
                width: 50,
                height: 50,
              ))
            ],
          ),
          Container(
            color: footerColor,
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "More Info".tr,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 14,
                    color: footerColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
