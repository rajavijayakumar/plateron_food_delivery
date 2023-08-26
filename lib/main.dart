import 'package:flutter/material.dart';
import 'package:my_flutter_project/views/pages/cart_page.dart';
import 'package:my_flutter_project/provider/cart_provider.dart';
import 'package:my_flutter_project/utils.dart';
import 'package:provider/provider.dart';

import 'views/pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Cart(menuModels: dummyInputs))
      ],
      child: MaterialApp(
        title: 'Food Delivery App',
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const MyHomePage(),
          '/cart': (context) => const CartPage(),
        },
      ),
    );
  }
}
