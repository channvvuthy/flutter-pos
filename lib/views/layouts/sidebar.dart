// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/menu.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.amber,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return item.containsKey("child")
              ? _buildMenuTree(item)
              : _buildMenu(item);
        },
      ),
    );
  }

  Widget _buildMenu(Map<String, dynamic> item) {
    return ListTile(
      title: InkWell(
        onTap: () {
          // Handle main item tap
          Get.updateLocale(const Locale('en', 'US'));
        },
        child: Row(
          children: [
            SvgPicture.asset(
              item["icon"].toString(),
              width: 20,
              height: 20,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Text(item["title"].toString().tr),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuTree(Map<String, dynamic> item) {
    return ExpansionTile(
      title: InkWell(
        onTap: () {
          // Handle main item tap
          Get.updateLocale(const Locale('en', 'US'));
        },
        child: Row(
          children: [
            SvgPicture.asset(
              item["icon"].toString(),
              width: 20,
              height: 20,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Text(item["title"].toString().tr),
          ],
        ),
      ),
      children: (item["child"] as List<Map<String, dynamic>>).map((subItem) {
        return _buildMenu(subItem);
      }).toList(),
    );
  }
}
