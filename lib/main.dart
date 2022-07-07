import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inventorycontrol/modules/login/components/auth_service.dart';
import 'package:inventorycontrol/modules/my_app/my_app.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: const MyApp(),
    ),
  );
}
