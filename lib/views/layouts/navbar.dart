// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/color.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: borderBottom)),
              color: white,
            ),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: SvgPicture.asset(
                    "assets/icons/search.svg",
                    color: secondary,
                    width: 18,
                    height: 18,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                InkWell(
                  child: SvgPicture.asset(
                    "assets/icons/comment.svg",
                    color: secondary,
                    width: 18,
                    height: 18,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                InkWell(
                  child: SvgPicture.asset(
                    "assets/icons/bell.svg",
                    color: secondary,
                    width: 18,
                    height: 18,
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
