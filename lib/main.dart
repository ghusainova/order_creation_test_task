import 'package:flutter/material.dart';

import 'core/di/service_locator.dart';

import 'presentation/pages/create_order_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CreateOrderPage(),
    );
  }
}
