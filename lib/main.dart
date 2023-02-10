import 'package:cloudsky/bindings/initial_bindings.dart';
import 'package:cloudsky/config/routes_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CloudSky',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: RoutesConfig.routes(),
    );
  }
}
