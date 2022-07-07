import 'package:flutter/material.dart';
import 'package:inventorycontrol/modules/home/pages/home_page.dart';
import 'package:inventorycontrol/modules/login/components/auth_check.dart';
import 'package:inventorycontrol/themes/default_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory Control',
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: AuthCheck(),
    );
  }
}
