// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/menu.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: InkWell(
              onTap: () {
                print("lange has been change to en");
                Get.updateLocale(const Locale('en', 'US'));
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    items[index]["icon"].toString(),
                    width: 20,
                    height: 20,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(items[index]["title"].toString().tr),
                ],
              ),
            ));
          },
        ));
  }
}
