import 'package:blog_mobile/Services/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Services/Translations/messages_tr.dart';

void main() {
  runApp(
    AppDelegate()
  );
}

class AppDelegate extends StatelessWidget with AppRoutes {
  AppDelegate({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      translations: Messages(),
      locale: const Locale('ms', 'MY'),
      fallbackLocale: const Locale('en', 'UK'),
      title: 'Blog Mobile',
      initialRoute: routeHome,
      getPages: generateRoutes
    );
  }
}