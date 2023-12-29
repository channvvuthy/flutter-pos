// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/language_translation.dart';
import 'package:pos/views/layouts/navbar.dart';
import 'package:pos/views/layouts/sidebar.dart';
import 'package:window_manager/window_manager.dart';
import 'constants/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  windowManager.waitUntilReadyToShow().then((_) async {
  });

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
        locale: Locale('km', 'KH'),
        debugShowCheckedModeBanner: false,
        title: 'Point Of Sale'.tr,
        home: Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                children: [
                  // Left Sidebar
                  SizedBox(
                    width: 300.0,
                    height: constraints.maxHeight,
                    child: Sidebar(),
                  ),
                  // Main Content Area
                  Expanded(
                    child: Container(
                      color: bgContent,
                      child: Column(children: [
                        Navbar()
                      ],),
                      // Add your main content here
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
