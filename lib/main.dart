// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/components/rectangle.dart';
import 'package:pos/components/title.dart';
import 'package:pos/data/report_summary.dart';
import 'package:pos/language_translation.dart';
import 'package:pos/views/layouts/navbar.dart';
import 'package:pos/views/layouts/sidebar.dart';
import 'package:window_manager/window_manager.dart';
import 'constants/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.maximize();
    await windowManager.setTitle('Point Of Sale'.tr);
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
                  SizedBox(width: 300, child: Sidebar()),
                  // Main Content Area
                  Expanded(
                    child: Container(
                      color: bgContent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Navbar(),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: title("Dashboard"),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            height: 127,
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                // Number of columns
                                crossAxisSpacing: 15.0,
                                // Spacing between columns
                                mainAxisSpacing: 15.0, // Spacing between rows
                              ),
                              itemCount: reportSummaries.length, // Number of rectangles
                              itemBuilder: (BuildContext context, int index) {
                                final item = reportSummaries[index];
                                return Rectangle(
                                  total: int.parse(item['total'].toString()),
                                  description: item['description'].toString(),
                                  bgColor:  Color(int.parse('0xFF${item['bgColor']}')),
                                  footerColor:  Color(int.parse('0xFF${item['footerColor']}')),
                                  assetIcon: item['icon'].toString(),
                                );
                              },
                            ),
                          )
                        ],
                      ),
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
