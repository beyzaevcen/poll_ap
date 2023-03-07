import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:poll_app/screens/home_page.dart';

import 'utils/theme.dart';

void main() {
  EasyLoading.instance
    ..indicatorColor = CColors.white
    ..indicatorSize = 80
    ..errorWidget = const Icon(
      Icons.warning,
      color: CColors.white,
    )
    ..indicatorType = EasyLoadingIndicatorType.circle;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        builder: (BuildContext context, Widget? child) {
          return FlutterEasyLoading(child: child);
        },
        debugShowCheckedModeBanner: false,
        home: const HomePage());
  }
}
