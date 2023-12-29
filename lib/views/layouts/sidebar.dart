// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/components/avatar.dart';
import 'package:pos/constants/color.dart';
import '../../constants/system.dart';
import '../../data/menu.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondary,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  systemTitle.tr,
                  style: TextStyle(color: grayish, fontSize: 18),
                ),
              ),
            ],
          ),
          _divider(),
          Container(
            padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Avatar(
                    imageUrl:
                        "https://th.bing.com/th/id/OIG.hSKc.XhLnL7SPxOdkRsU",
                    size: 30),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Elaine Jacobs",
                  style: TextStyle(color: grayish),
                )
              ],
            ),
          ),
          _divider(),
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  return item.containsKey("child")
                      ? _buildMenuTree(item)
                      : _buildMenu(item);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenu(Map<String, dynamic> item) {
    return ListTile(
      title: InkWell(
        onTap: () {
          // Handle main item tap
        },
        child: Row(
          children: [
            SvgPicture.asset(
              item["icon"].toString(),
              width: 20,
              height: 20,
              color: grayish,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              item["title"].toString().tr,
              style: TextStyle(color: grayish),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuTree(Map<String, dynamic> item) {
    return InkWell(
      onTap: () {
        // Handle main item tap
      },
      child: ExpansionTile(
        title: Row(
          children: [
            SvgPicture.asset(
              item["icon"].toString(),
              width: 20,
              height: 20,
              color: grayish,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              item["title"].toString().tr,
              style: TextStyle(color: grayish),
            ),
          ],
        ),
        trailing: Icon(
          Icons.arrow_drop_down, // You can customize the icon as needed
          color: Colors.grey, // You can customize the color as needed
        ),
        children: (item["child"] as List<Map<String, dynamic>>).map((subItem) {
          return _buildMenu(subItem);
        }).toList(),
      ),
    );
  }
}

Widget _divider() {
  return Container(
    width: double.infinity,
    height: 1, // Set the height as the thickness
    color: divider, // Set the border color
  );
}
