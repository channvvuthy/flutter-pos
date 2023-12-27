// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/language_translation.dart';
import 'package:pos/views/layouts/sidebar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LanguageTranslation(),
      fallbackLocale: Locale('km', 'KH'),
      locale: Get.deviceLocale,
      debugShowCheckedModeBanner: false, 
      title: 'Point Of Sale',
      home: Scaffold(
          body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Sidebar(),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    child: Center(
                      child: Text('Home'.tr),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
